/**
 * Leaflet.draw assumes that you have already included the Leaflet library.
 */
L.drawVersion = '0.4.2';
/**
 * @class L.Draw
 * @aka Draw
 *
 *
 * To add the draw toolbar set the option drawControl: true in the map options.
 *
 * @example
 * ```js
 *      var map = L.map('map', {drawControl: true}).setView([51.505, -0.09], 13);
 *
 *      L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
 *          attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
 *      }).addTo(map);
 * ```
 *
 * ### Adding the edit toolbar
 * To use the edit toolbar you must initialise the Leaflet.draw control and manually add it to the map.
 *
 * ```js
 *      var map = L.map('map').setView([51.505, -0.09], 13);
 *
 *      L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
 *          attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
 *      }).addTo(map);
 *
 *      // FeatureGroup is to store editable layers
 *      var drawnItems = new L.FeatureGroup();
 *      map.addLayer(drawnItems);
 *
 *      var drawControl = new L.Control.Draw({
 *          edit: {
 *              featureGroup: drawnItems
 *          }
 *      });
 *      map.addControl(drawControl);
 * ```
 *
 * The key here is the featureGroup option. This tells the plugin which FeatureGroup contains the layers that
 * should be editable. The featureGroup can contain 0 or more features with geometry types Point, LineString, and Polygon.
 * Leaflet.draw does not work with multigeometry features such as MultiPoint, MultiLineString, MultiPolygon,
 * or GeometryCollection. If you need to add multigeometry features to the draw plugin, convert them to a
 * FeatureCollection of non-multigeometries (Points, LineStrings, or Polygons).
 */
L.Draw = {};
L.Draw.constants = {
	iconSize: 40,
	anchorSize: 10
}
/**
 * @class L.drawLocal
 * @aka L.drawLocal
 *
 * The core toolbar class of the API — it is used to create the toolbar ui
 *
 * @example
 * ```js
 *      var modifiedDraw = L.drawLocal.extend({
 *          draw: {
 *              toolbar: {
 *                  buttons: {
 *                      polygon: 'Draw an awesome polygon'
 *                  }
 *              }
 *          }
 *      });
 * ```
 *
 * The default state for the control is the draw toolbar just below the zoom control.
 *  This will allow map users to draw vectors and markers.
 *  **Please note the edit toolbar is not enabled by default.**
 */
L.drawLocal = {
	// format: {
	// 	numeric: {
	// 		delimiters: {
	// 			thousands: ',',
	// 			decimal: '.'
	// 		}
	// 	}
	// },
	draw: {
		toolbar: {
			// #TODO: this should be reorganized where actions are nested in actions
			// ex: actions.undo  or actions.cancel
			actions: {
				title: 'Cancel draw',
				text: 'Cancel'
			},
			finish: {
				title: 'Finish draw',
				text: 'Finish'
			},
			undo: {
				title: 'Delete last draw object',
				text: 'Delete object'
			},
			buttons: {
				polyline: 'Create Poliline',
				polygon: 'Vẽ đa giác',
				rectangle: 'Vẽ hình chữ nhật',
				circle: 'Vẽ hình tròn',
				marker: 'Create Marker',
				vicemarker: 'Thêm điểm dịch vụ',
				circlemarker: 'Thêm hố kỹ thuật'
			}
		},
		handlers: {
			circle: {
				tooltip: {
					start: 'Mouse and drag to draw.'
				},
				radius: 'Radius'
			},
			circlemarker: {
				tooltip: {
					start: 'Select on the map to draw.'
				}
			},
			marker: {
				tooltip: {
					start: 'Select a point on the map to place the station.'
				}
			},
			vicemarker: {
				tooltip: {
					start: 'Chọn 1 điểm trên bản đồ để đặt trạm.'
				}
			},
			polygon: {
				tooltip: {
					start: 'Nhấp chuột để bắt đầu vẽ.',
					cont: 'Nhấp chuột để tiếp tục vẽ.',
					end: 'Nhấp đúp chuột hoặc nhấp chọn điểm đầu tiên để kết thúc.'
				}
			},
			polyline: {
				error: '<strong>Lỗi:</strong> hình vẽ không hợp lệ!',
				tooltip: {
					start: 'Click to start drawing.',
					cont: 'Click to continue drawing.',
					end: 'Double click or click the last point to finish.'
				}
			},
			rectangle: {
				tooltip: {
					start: 'Nhấp - giữ chuột và kéo để vẽ hình.'
				}
			},
			simpleshape: {
				tooltip: {
					end: 'Thả chuột để kết thúc.'
				}
			}
		}
	},
	edit: {
		toolbar: {
			actions: {
				save: {
					title: 'Ghi lại những thay đổi',
					text: 'Ghi lại'
				},
				cancel: {
					title: 'Hủy bỏ những thay đổi',
					text: 'Hủy ghi'
				},
				clearAll: {
					title: 'Xóa tất cả các lớp',
					text: 'Xóa tất cả'
				}
			},
			buttons: {
				edit: 'Chỉnh sửa',
				editDisabled: 'Không có lớp thông tin cần chỉnh sửa',
				remove: 'Xóa lớp',
				removeDisabled: 'Không có lớp thông tin cần xóa'
			}
		},
		handlers: {
			edit: {
				tooltip: {
					text: 'Kéo hoặc nhấp chọn để chỉnh sửa',
					subtext: 'Chọn "Hủy" để hủy ghi.'
				}
			},
			remove: {
				tooltip: {
					text: 'Nhấp chọn đối tượng để xóa'
				}
			}
		}
	}
};
