namespace GIS_Technolory.Serivces
{
    public static class ConnectionService
    {
        public static string connstring = string.Empty;
        public static void Set(IConfiguration config)
        {
            connstring = config.GetConnectionString("SqlConnection");
        }
    }
}
