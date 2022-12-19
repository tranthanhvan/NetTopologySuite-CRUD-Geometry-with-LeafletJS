using GIS_Technolory.Helpers;
using GIS_Technolory.Response;
using Microsoft.AspNetCore.Mvc;
using NuGet.Packaging.Signing;

namespace GIS_Technolory.Controllers
{
    [Route("icon")]
    public class ImageController : Controller
    {

        [HttpPost("upload"), DisableRequestSizeLimit]
        [Consumes("multipart/form-data")]
        public async Task<IActionResult> Upload(IFormFile file)
        {
            var response = new Response<string>();

            List<string> ImageExtensions = new List<string> { ".JPG", ".JPE", ".GIF", ".PNG", };

            long byteCount = file.Length;

            if (byteCount > 5000000)
            {
                response.Success = false;
                response.Message = "file size > 5MB";
                return Ok(response);
            }

            var datetime = DateTime.Now;
            string year = datetime.ToString("yyyy");
            string month = datetime.ToString("MM");
            string day = datetime.ToString("dd");
            string pathDirectory = System.IO.Path.GetFullPath("wwwroot/Image/") + $"{year}/{month}/{day}";
            bool exists = System.IO.Directory.Exists(pathDirectory);

            if (!exists)
                System.IO.Directory.CreateDirectory(pathDirectory);

            string fileName = $"/{year}/{month}/{day}/{file.FileName}";
            string path = System.IO.Path.GetFullPath("wwwroot/Image") + fileName;
            var check = await file.SaveImage(path);

            if (check.Success)
                response.Data = $"/Image{fileName}";

            response.Success = check.Success;
            return Ok(response);
        }
    }
}
