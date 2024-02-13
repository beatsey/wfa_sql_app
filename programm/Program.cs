using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace programm
{
    internal static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            bool create_console_window = false;
            if (create_console_window)
            {
                // Запускаем окно с выводом консоли
                StringWriter consoleOut = new StringWriter();
                Console.SetOut(consoleOut);
                Thread thread1 = new Thread(() => Application.Run(new ConsoleOutput(consoleOut)));
                thread1.Start();
            }

            // Запускаем окно авторизации
            Application.Run(new LoginForm());
        }
    }
}
