using GIS_Technolory.Models;

namespace GIS_Technolory.Helpers
{
    public static class SphericalUtil
    {
        const double EARTH_RADIUS = 6378137;

        private static double ToRadians(double input)
        {
            return input / 180.0 * Math.PI;
        }

        private static double hav(double x)
        {
            double sinHalf = Math.Sin(x * 0.5);
            return sinHalf * sinHalf;
        }


        private static double havDistance(double lat1, double lat2, double dLng)
        {
            return hav(lat1 - lat2) + hav(dLng) * Math.Cos(lat1) * Math.Cos(lat2);
        }

        private static double arcHav(double x)
        {
            return 2 * Math.Asin(Math.Sqrt(x));
        }

        private static double distanceRadians(double lat1, double lng1, double lat2, double lng2)
        {
            return arcHav(havDistance(lat1, lat2, lng1 - lng2));
        }

        /**
        * Returns the length of the given path, in meters, on Earth.
        */
        public static double computeLength(List<LatLongModel> latlngs)
        {
            if (latlngs.Count < 2)
                return 0;

            double length = 0;
            LatLongModel prev = latlngs.FirstOrDefault();
            double prevLat = ToRadians(prev.lat);
            double prevLng = ToRadians(prev.lng);

            foreach (var point in latlngs)
            {
                double lat = ToRadians(point.lat);
                double lng = ToRadians(point.lng);
                length += distanceRadians(prevLat, prevLng, lat, lng);
                prevLat = lat;
                prevLng = lng;
            }
            return length * EARTH_RADIUS;
        }


        public static double ComputeSignedArea(List<LatLongModel> latlngs)
        {
            return ComputeSignedArea(latlngs, EARTH_RADIUS);
        }

        private static double ComputeSignedArea(IList<LatLongModel> path, double radius)
        {
            int size = path.Count;
            if (size < 3) { return 0; }
            double total = 0;
            var prev = path[size - 1];
            double prevTanLat = Math.Tan((Math.PI / 2 - ToRadians(prev.lat)) / 2);
            double prevLng = ToRadians(prev.lng);

            foreach (var point in path)
            {
                double tanLat = Math.Tan((Math.PI / 2 - ToRadians(point.lat)) / 2);
                double lng = ToRadians(point.lng);
                total += PolarTriangleArea(tanLat, lng, prevTanLat, prevLng);
                prevTanLat = tanLat;
                prevLng = lng;
            }
            return total * (radius * radius);
        }

        static double PolarTriangleArea(double tan1, double lng1, double tan2, double lng2)
        {
            double deltaLng = lng1 - lng2;
            double t = tan1 * tan2;
            return 2 * Math.Atan2(t * Math.Sin(deltaLng), 1 + t * Math.Cos(deltaLng));
        }
    }
}
