using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MobileWorld.common
{
    public class GeneratePassword
    {
        public static string Generate(int length = 10)
        {
            Random random = new Random();
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@$%^&?abcdefghijklmnopqrstuvwxyz";
            string newPass = new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
            return newPass;
        }
    }
}