using GIS_Technolory.Response;
using System.Text;

namespace GIS_Technolory.Helpers
{
    public static class Extendsions
    {
        /// <summary>
        /// Create random
        /// </summary>
        /// <param name="length"></param>
        /// <returns></returns>
        public static string CreateRandomLayerName(int length)
        {
            const string valid = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            StringBuilder res = new StringBuilder();
            Random rnd = new Random();
            while (0 < length--)
            {
                res.Append(valid[rnd.Next(valid.Length)]);
            }
            return res.ToString();
        }

        public static async Task<Response<string>> SaveImage(this IFormFile file, string path)
        {
            var objReturn = new Response<string>();
            try
            {
                using (var stream = new FileStream(path, FileMode.Create))
                {
                    await file.CopyToAsync(stream);
                }
                objReturn.Success = true;
            }
            catch (Exception ex)
            {
                objReturn.Success = false;
                objReturn.Data = ex.ToString();
            }
            return objReturn;
        }
    }
}
