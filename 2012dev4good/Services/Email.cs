using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Configuration;
using System.Net.Configuration;

namespace _2012dev4good.Services
{
    public class Email
    {
        public static SmtpSection SMTPSettings()
        {
            var config = ConfigurationManager.GetSection("system.net/mailSettings/smtp") as SmtpSection;
            return (config != null) ? config : null;
        }


        public static void SendEmail(string ToName, string ToAddress, string Subject, string Body)
        {

            SmtpClient client = new SmtpClient();

            var Config = SMTPSettings();

            MailAddress
                maFrom = new MailAddress(Config.From, Config.From, Encoding.UTF8),
                maTo = new MailAddress(ToAddress, ToName, Encoding.UTF8);
            MailMessage mmsg = new MailMessage(maFrom.Address, maTo.Address);
            mmsg.Body = Body;
            mmsg.BodyEncoding = Encoding.UTF8;
            mmsg.IsBodyHtml = true;
            mmsg.Subject = Subject;
            mmsg.SubjectEncoding = Encoding.UTF8;

            try
            {
                client.Send(mmsg);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString(), ex.Message);
                //throw; 
            }

        }

    }
}