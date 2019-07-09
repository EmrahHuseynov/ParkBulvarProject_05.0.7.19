using Microsoft.AspNetCore.Http;
using System;
using System.IO;
using System.Reflection;

namespace ParkBulvarProject
{
    public static class Helper
    {
        public static string ImageUpload(string path, IFormFile img)
        {
            var uploads = Path.Combine(path);
            string fileID = Guid.NewGuid().ToString().Replace("-", "");
            string filename = fileID + img.ContentType.Replace("image/", ".");
            var filePath = Path.Combine(uploads, filename);
            using (var fileStream = new FileStream(filePath, FileMode.Create))
            {
                 img.CopyTo(fileStream);
            }
            return filename;
        }
        public static string SvgUpload(string path, IFormFile img)
        {
            var uploads = Path.Combine(path);
            string fileID = Guid.NewGuid().ToString().Replace("-", "");
            string filename = fileID + ".svg";
            var filePath = Path.Combine(uploads, filename);
            using (var fileStream = new FileStream(filePath, FileMode.Create))
            {
                img.CopyTo(fileStream);
            }

            return filename;

        }


        public static void DeleteImage(string filename, string path)
        {
            string fileName = (path + filename);
            if (File.Exists(fileName))
            {
                File.Delete(fileName);
            }
        }

        public static bool ImageIsValid(IFormFile file)
        {
            if (file.Length <= 4 * 1024 * 1024 && (file.ContentType == "image/jpg" ||
                           file.ContentType == "image/jpeg" ||
                           file.ContentType == "image/png" ||
                           file.ContentType == "image/gif"))
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        public static string GetErrorMessage()
        {
            return "Fayl yüklənərkən xəta baş verdi.Faylın tipini və ölçüsünü yenidən nəzərdən keçirin.Faylın ölçüsü 500kb dan çox ola bilməz!";
        }

        public static string OzetCek(string Metin, int Karakter)
        {
            if (Metin == string.Empty || Metin == null)
                Metin = "";
            if (Metin.Length >= Karakter)
                Metin = Metin.Substring(0, Karakter);

            return Metin;
        }
    }

}
