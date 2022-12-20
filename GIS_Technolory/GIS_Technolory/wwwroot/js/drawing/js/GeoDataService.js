var settings = {
    baseUrl: 'http://api.gateway.local/',
    //baseUrl: 'http://api-gisvt.viit.vn/gateway/',
    //baseUrl: 'http://api-gis.laocai.gov.vn/gateway/',
}

var mapConstants = {
    mapObjectTypes: {
        telePortMarker: 'TelePortMarker',
        
    }
}

var crudResult = {
    status: false,
    message: '',
    data: ''
}

L.geoDataService = (function () {

    var createTelePort = function (data, callback) {
        var url = '${settings.baseUrl}geodata/create-teleport-markers';

        httpService.post(url, data, function (ret) {
            //console.log(ret);
            crudResult.status = true;
            crudResult.data = ret;
            if (typeof callback === 'function') {
                callback(crudResult);
            }
        }, function (errorMsg) {
            //alert('Không tạo được điểm trạm: ' + errorMsg);
            crudResult.status = false;
            crudResult.message = errorMsg;
            if (typeof callback === 'function') {
                callback(crudResult);
            }
        });
    },
        createCableRoute = function (e) {

        },
        createSpliterPorts = function (e) {

        },
        createOtherNote = function (e) {

        },
        listTelePorts = function (data, callback) {
            var url = '${settings.baseUrl}geodata/list-teleport-markers';

            httpService.post(url, data, function (ret) {
                //console.log(ret);
                crudResult.status = true;
                crudResult.data = ret;
                if (typeof callback === 'function') {
                    callback(crudResult);
                }
            }, function (errorMsg) {
                crudResult.status = false;
                crudResult.message = errorMsg;
                if (typeof callback === 'function') {
                    callback(crudResult);
                }
            });
        },
        listMarkers = function (data, callback) {
            var url = `${settings.baseUrl}geodata/list-markers`;

            httpService.post(url, data, function (ret) {
                //console.log(ret);
                crudResult.status = true;
                crudResult.data = ret;
                if (typeof callback === 'function') {
                    callback(crudResult);
                }
            }, function (errorMsg) {
                crudResult.status = false;
                crudResult.message = errorMsg;
                if (typeof callback === 'function') {
                    callback(crudResult);
                }
            });
        },
        searchMarkers = function (data, callback) {
            var url = `${settings.baseUrl}geodata/search-markers`;

            httpService.post(url, data, function (ret) {
                //console.log(ret);
                crudResult.status = true;
                crudResult.data = ret;
                if (typeof callback === 'function') {
                    callback(crudResult);
                }
            }, function (errorMsg) {
                crudResult.status = false;
                crudResult.message = errorMsg;
                if (typeof callback === 'function') {
                    callback(crudResult);
                }
            });
        }


    return {
        createTelePort: createTelePort,
        createCableRoute: createCableRoute,
        createSpliterPorts: createSpliterPorts,
        createOtherNote: createOtherNote,
        listTelePorts: listTelePorts,
        listMarkers: listMarkers,
        searchMarkers: searchMarkers
    }
})();