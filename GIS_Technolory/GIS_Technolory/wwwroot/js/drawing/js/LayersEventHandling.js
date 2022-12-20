
var TeleportMarker = L.Icon.extend({
    options: {
        shadowUrl: '/js/leaflet/images/marker-shadow-4.41.png',
        iconAnchor: new L.Point(L.Draw.constants.anchorSize, L.Draw.constants.anchorSize),
        iconSize: new L.Point(L.Draw.constants.iconSize, L.Draw.constants.iconSize),
        iconUrl: '/js/leaflet/images/marker-icon-4.41.png'
    }
});


L.eventHandling = (function () {

    var telePortOnClick = function (e) {
        var selectedLayer = e.layer,
            selectedLayerId = e.layer._leaflet_id,
            latLng = e.layer._latlng;

       //console.log(e);

        //console.log('Layer id:', selectedLayerId, ' LatLong: ', latLng);
    },
        cableRouteOnClick = function (e) {
            var selectedLayer = e.layer,
                selectedLayerId = e.layer._leaflet_id,
                pxBounds = e.layer._pxBounds,
                latLngs = e.layer._latlngs;

            //console.log(e);

            //console.log('Layer id:', selectedLayerId, ' LatLong: ', latLngs);

        },
        spliterPortsOnClick = function (e) {
            var selectedLayer = e.layer,
                selectedLayerId = e.layer._leaflet_id,
                latLng = e.layer._latlng;

           // console.log(e);

           // console.log('Layer id:', selectedLayerId, ' LatLong: ', latLng);
        },
        otherNoteOnClick = function (e) {
            var selectedLayer = e.layer,
                selectedLayerId = e.layer._leaflet_id,
                latLng = e.layer._latlng;

           // console.log(e);

           // console.log('Layer id:', selectedLayerId, ' LatLong: ', latLng);
        },
        listTelePorts = function (data, callback) {
            var geoDataService = L.geoDataService;
            var markers = [];

            geoDataService.listTelePorts(data, function (result) {
                if (result.status && result.data) {

                    result.data.forEach(function (item, index, arr) {
                        var latLongs = item.latLngs;

                        latLongs.forEach(function (latLng) {
                            var marker = L.marker([latLng.lat, latLng.lng], { mapId: item.mapId, icon: new TeleportMarker() }).addTo(map);
                            marker.bindPopup(item.popupContent);
                            markers.push(marker);
                        });
                    });

                    if (markers && markers.length > 0 && callback) {
                        callback(markers);
                    }
                }
            });
        },

        listMarkers = function (data, callback) {
            var geoDataService = L.geoDataService;
            var markers = [];

            geoDataService.listMarkers(data, function (result) {
                if (result.status && result.data) {
                    result.data.forEach(function (item, index, arr) {
                        var latLongs = item.latLngs;

                        latLongs.forEach(function (latLng) {
                            if (item.type == mapConstants.mapObjectTypes.telePortMarker) {
                                var marker = L.marker([latLng.lat, latLng.lng], { mapId: item.mapId, icon: new TeleportMarker() });
                                marker.type = item.type;
                                marker.addTo(map);
                                marker.bindPopup(item.popupContent);
                                markers.push(marker);
                            }
                           
                            if (item.type == mapConstants.mapObjectTypes.clientMarker) {
                                var marker = L.vicemarker([latLng.lat, latLng.lng], { mapId: item.mapId, icon: new ClientMarker() });
                                marker.type = item.type;
                                marker.addTo(map);
                                marker.bindPopup(item.popupContent);
                                markers.push(marker);
                            }
                            if (item.type == mapConstants.mapObjectTypes.splitterPort) {
                                var marker = L.circleMarker([latLng.lat, latLng.lng], { mapId: item.mapId, icon: new SplitterPort() });
                                marker.type = item.type;
                                marker.addTo(map);
                                marker.bindPopup(item.popupContent);
                                markers.push(marker);
                            }                            
                        });                        
                        if (item.type == mapConstants.mapObjectTypes.cableRoute) {
                            var cable = L.polyline(latLongs, { mapId: item.mapId });
                            cable.type = item.type;
                            cable.addTo(map);
                            cable.bindPopup(item.popupContent);
                            markers.push(cable);
                        }
                    });

                    if (markers && markers.length > 0 && callback) {
                        callback(markers);
                    }
                }
            });
        },
        
        telePortOnCreate = function (data, callback) {
            var geoDataService = L.geoDataService;
            return geoDataService.createTelePort(data, callback);
        }
        


    return {
        telePortOnClick: telePortOnClick,
        cableRouteOnClick: cableRouteOnClick,
        spliterPortsOnClick: spliterPortsOnClick,
        otherNoteOnClick: otherNoteOnClick,
        listTelePorts: listTelePorts,
        listMarkers: listMarkers,
        telePortOnCreate: telePortOnCreate,
    }
})();