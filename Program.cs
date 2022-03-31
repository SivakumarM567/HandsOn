using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FileHandling2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            FileHandling1 fileHandling = new FileHandling1();
            fileHandling.ReadFile();
            Console.Read();
        }
    }
}