using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace FileHandling2
{
    internal class FileHandling1
    {
        public void ReadFile()
        {
            FileStream fileStream = new FileStream(@"E:\Capgemini\FileHandling\htmlFile.txt", FileMode.Open, FileAccess.Read);
            StreamReader reader = new StreamReader(fileStream);
            int count=0;
            while (reader.Peek() > 0)
            {
                string line = reader.ReadLine();
                if (line.Contains("<input"))
                {
                    Console.WriteLine(line);
                    count++;
                }
            }
            Console.WriteLine("Number of <input = " + count);
            reader.Close();
            fileStream.Close();
        }
    }
}
