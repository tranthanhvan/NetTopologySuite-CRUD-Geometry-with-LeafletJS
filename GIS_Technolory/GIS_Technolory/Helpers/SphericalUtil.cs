using GIS_Technolory.Models;

namespace GIS_Technolory.Helpers
{
    public static class SphericalUtil
    {
        const double EARTH_RADIUS = 6371009;

        private static double ToRadians(double input)
        {
            return input / 180.0 * Math.PI;
        }

        public static double ComputeSignedArea(List<LatLongModel> path)
        {
            path.Reverse();
            return ComputeSignedArea(path, EARTH_RADIUS);
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
