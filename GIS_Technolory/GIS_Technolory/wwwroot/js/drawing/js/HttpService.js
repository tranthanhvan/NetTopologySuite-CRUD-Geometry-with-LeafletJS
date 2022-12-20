"use strict";
var httpService = (function () {    
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.withCredentials = false;


    var sendRequest = function (method, url, data, success_callback, fail_callback) {
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState === XMLHttpRequest.DONE) {
                if (xmlhttp.status === 200) {
                    success_callback(xmlhttp.response);
                } else {
                    fail_callback(xmlhttp.statusText, xmlhttp);
                }
            }
        };
        
        if (method === "POST") {
            xmlhttp.open(method, url, true);            
            xmlhttp.setRequestHeader("Content-Type", "application/json");
            xmlhttp.responseType = "json";
            //xmlhttp.send(data);
            xmlhttp.send(JSON.stringify(data));
        } else if (method === "GET") {
            xmlhttp.open(method, url);
            xmlhttp.send();
        }
    };

    var uploadData = function (url, data, success_callback, fail_callback, progress_callback) {
        var method = "POST";
        if (!data) {
            if (fail_callback) {
                fail_callback("Data is empty!");
            }
            return;
        }

        url = Oms.baseUrl + url;
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState === XMLHttpRequest.DONE) {
                if (xmlhttp.status === 200) {
                    success_callback(xmlhttp.responseText);
                } else {
                    fail_callback(xmlhttp.statusText, xmlhttp);
                }
            }
        };
        xmlhttp.upload.addEventListener('progress', function (e) {
            var percent_complete = (e.loaded / e.total) * 100;
            if (progress_callback) {
                progress_callback(percent_complete);
            }
        });

        xmlhttp.open(method, url);
        xmlhttp.responseType = '';
        xmlhttp.send(data);
    };

    var postData = function (url, data, success_callback, fail_callback) {
        return sendRequest("POST", url, data, success_callback, fail_callback);
    };

    var returnDownloadBytes = function (xmlhttp) {
        var filename = "";
        var disposition = xmlhttp.getResponseHeader('Content-Disposition');
        if (disposition && disposition.indexOf('attachment') !== -1) {
            var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
            var matches = filenameRegex.exec(disposition);
            if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '');
        }
        var type = xmlhttp.getResponseHeader('Content-Type');

        var blob;
        if (typeof File === 'function') {
            try {
                blob = new File([xmlhttp.response], filename, { type: type });
            } catch (e) { /* Edge */ }
        }
        if (typeof blob === 'undefined') {
            blob = new Blob([xmlhttp.response], { type: type });
        }

        if (typeof window.navigator.msSaveBlob !== 'undefined') {
            // IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. 
            //These URLs will no longer resolve as the data backing the URL has been freed."
            window.navigator.msSaveBlob(blob, filename);
        } else {
            var URL = window.URL || window.webkitURL;
            var downloadUrl = URL.createObjectURL(blob);

            if (filename) {
                // use HTML5 a[download] attribute to specify filename
                var a = document.createElement("a");
                // safari doesn't support this yet
                if (typeof a.download === 'undefined') {
                    window.location = downloadUrl;
                } else {
                    a.href = downloadUrl;
                    a.download = filename;
                    document.body.appendChild(a);
                    a.click();
                }
            } else {
                window.location = downloadUrl;
            }

            setTimeout(function () { URL.revokeObjectURL(downloadUrl); }, 100); // cleanup
        }

        return filename;
    }

    var postDownloadData = function (url, data, success_callback, fail_callback) {
        var method = "POST";
        if (!data) {
            if (fail_callback) {
                fail_callback("Data is empty!");
            }
            return;
        }

        url = Oms.baseUrl + url;
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState === XMLHttpRequest.DONE) {
                if (xmlhttp.status === 200) {
                    success_callback(returnDownloadBytes(xmlhttp));
                } else {
                    fail_callback(xmlhttp.statusText, xmlhttp);
                }
            }
        };

        xmlhttp.open(method, url);
        xmlhttp.setRequestHeader("Content-Type", "application/json");
        xmlhttp.responseType = 'arraybuffer';
        xmlhttp.send(JSON.stringify(data));
    };

    var getData = function (url, success_callback, fail_callback) {
        return sendRequest("GET", url, null, success_callback, fail_callback);
    };

    var deleteData = function (url, data, success_callback, fail_callback) {
        return sendRequest("DELETE", url, data, success_callback, fail_callback);
    };

    return {
        post: postData,
        get: getData,
        delete: deleteData,
        upload: uploadData,
        postDownload: postDownloadData
    };

})();