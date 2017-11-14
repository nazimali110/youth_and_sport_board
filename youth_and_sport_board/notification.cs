using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Collections;
using System.Data;
using System.IO.Ports;
using System.Threading;
using System.Text.RegularExpressions;
using System.ComponentModel;
using System.IO;
using SMSapplication;

namespace youth_and_sport_board
{
    public class notification
    {
        // smsclass sms;
        SerialPort port = new SerialPort();
        clsSMS objclsSMS = new clsSMS();
        ShortMessageCollection objShortMessageCollection = new ShortMessageCollection();
        int milliseconds = 5000;
        DataClassesDataContext db = new DataClassesDataContext();
        public string emailnotfi(string textbody, string subj)
        {
            try
            {
                var getemail=(from s in db.m_notifications join log in db.e_logins on s.loginid equals log.loginid select new [] {log.emailadd.ToString()}).ToList();
               
                
                MailMessage mail = new MailMessage();
                for (int i = 0; i < getemail.Count; i++)
                {
                    mail.To.Add(getemail[i][0].ToString());
                }
                
                
                mail.From = new MailAddress("admen3198@gmail.com");
                mail.Subject = subj;

                //string Body = "Thank you for Registration /n verify your email to click the below link /n <a href='login.aspx?verify=" + verify + "'>Addvertize BillBoard</a>";
                mail.Body = textbody;
                mail.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Send(mail);
                return ", Email send has been send to your head members";
                

                // success.Visible = true;
                //  recvd.Visible = true;
                //  fnamebox.Text = ""; lnamebox.Text = ""; companybox.Text = ""; phonebox.Text = ""; emailbox.Text = ""; Countrybox.Text = ""; messbox.Text = "";
            }
            catch
            {
               return ", Error in internet Contection in Failedz";
               

            }
        }
     //   SerialPort SerialPort1 = new SerialPort();
   
        public string sendingsms(string sms)
        {
            this.port = objclsSMS.OpenPort("COM7", 460800, 8, 1,300);
            Thread.Sleep(1000);
            try
            {
                var getcontact = (from s in db.m_notifications join log in db.e_logins on s.loginid equals log.loginid select new[] { log.contactno.ToString() }).ToList();
                for (int i = 0; i < getcontact.Count; i++)
                {


                    if (objclsSMS.sendMsg(this.port, getcontact[i][0].ToString(), "dsfafaasfasasffas asdasdasd asdasdas"))
                    {
                      //  MessageBox.Show("Message has sent successfully");
                    }
                    else
                    {
                      //  MessageBox.Show("Failed to send message");
                    }
                    Thread.Sleep(milliseconds);
                }

                return ", Succefully Send sms to you heads";

            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }
        public void ErrorLog(string Message)
        {
            StreamWriter sw = null;

            try
            {
                string sLogFormat = DateTime.Now.ToShortDateString().ToString() + " " + DateTime.Now.ToLongTimeString().ToString() + " ==> ";
                string sPathName = @"E:\";

                string sYear = DateTime.Now.Year.ToString();
                string sMonth = DateTime.Now.Month.ToString();
                string sDay = DateTime.Now.Day.ToString();

                string sErrorTime = sDay + "-" + sMonth + "-" + sYear;

                sw = new StreamWriter(sPathName + "SMSapplication_ErrorLog_" + sErrorTime + ".txt", true);

                sw.WriteLine(sLogFormat + Message);
                sw.Flush();

            }
            catch (Exception ex)
            {
                ErrorLog(ex.ToString());
            }
            finally
            {
                if (sw != null)
                {
                    sw.Dispose();
                    sw.Close();
                }
            }


        }


        //public string gsmconnect(string sms)
        //{
        //    try
        //    {
        //        //SerialPort1.PortName = "COM6";

        //        //SerialPort1.BaudRate = 460800;
        //        //SerialPort1.Parity = Parity.None;
        //        //SerialPort1.StopBits = StopBits.One;
        //        //SerialPort1.DataBits = 8;
        //        //SerialPort1.Handshake = Handshake.RequestToSend;
        //        //SerialPort1.DtrEnable = true;
        //        //SerialPort1.RtsEnable = true;
        //        //SerialPort1.NewLine = "\r\n";

        //        //var getemail = (from s in db.m_notifications join log in db.e_logins on s.loginid equals log.loginid select new[] { log.emailadd.ToString() }).ToList();


        //        //SerialPort1.Open();

        //        //if (SerialPort1.IsOpen)
        //        //{
        //        //    for (int i = 0; i < getemail.Count; i++)
        //        //    {
        //        //        SerialPort1.Write("AT" + "\r\n");
        //        //        SerialPort1.Write("AT+CMGF=1" + "\r\n");
        //        //        SerialPort1.Write("AT+CMGS=" + (Char)34 + getemail[i][0].ToString() + (Char)34 + " \r\n ");

        //        //        SerialPort1.Write("hi" + (Char)26);
        //        //    }

        //        //    return "Sent";
        //        //}


        //        //else
        //        //{

        //        //    return ", for SMS Port not available";
        //        //}
        //    }
        //    catch (Exception ex)
        //    {
        //        return "Port not available";
        //    }
        //    return "null";
        //}

        //----------------------sms code------------------------
     //   SerialPort port = new SerialPort();
       // public AutoResetEvent receiveNow;
        //public SerialPort OpenPort()
        //{
        //    receiveNow = new AutoResetEvent(false);
        //    SerialPort port = new SerialPort();

        //    try
        //    {
        //        port.PortName = "COM1";                 //COM1
        //        port.BaudRate = 9600;                   //9600
        //        port.DataBits = 8;                   //8
        //        port.StopBits = StopBits.One;                  //1
        //        port.Parity = Parity.None;                     //None
        //        port.ReadTimeout = 300;             //300
        //        port.WriteTimeout = 300;           //300
        //      //  port.Encoding = Encoding.GetEncoding("iso-8859-1");
                
        //     //   port.DataReceived += new SerialDataReceivedEventHandler(port_DataReceived);
        //        port.Open();
        //        port.DtrEnable = true;
        //        port.RtsEnable = true;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    return port;
        //}
        //public string ExecCommand(SerialPort port, string command, int responseTimeout, string errorMessage)
        //{
        //    try
        //    {

        //        port.DiscardOutBuffer();
        //        port.DiscardInBuffer();
        //        receiveNow.Reset();
        //        port.Write(command + "\r");

        //        string input = ReadResponse(port, responseTimeout);
        //        if ((input.Length == 0) || ((!input.EndsWith("\r\n> ")) && (!input.EndsWith("\r\nOK\r\n"))))
        //            throw new ApplicationException("No success message was received.");
        //        return input;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
        //public string ReadResponse(SerialPort port, int timeout)
        //{
        //    string buffer = string.Empty;
        //    try
        //    {
        //        do
        //        {
        //            if (receiveNow.WaitOne(timeout, false))
        //            {
        //                string t = port.ReadExisting();
        //                buffer += t;
        //            }
        //            else
        //            {
        //                if (buffer.Length > 0)
        //                    throw new ApplicationException("Response received is incomplete.");
        //                else
        //                    throw new ApplicationException("No data received from phone.");
        //            }
        //        }
        //        while (!buffer.EndsWith("\r\nOK\r\n") && !buffer.EndsWith("\r\n> ") && !buffer.EndsWith("\r\nERROR\r\n"));
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    return buffer;
        //}
        //public bool sendMsg(SerialPort port, string PhoneNo, string Message)
        //{
        //    bool isSend = false;

        //    try
        //    {

        //        string recievedData = ExecCommand(port, "AT", 300, "No phone connected");
        //        recievedData = ExecCommand(port, "AT+CMGF=1", 300, "Failed to set message format.");
        //        String command = "AT+CMGS=\"" + PhoneNo + "\"";
        //        recievedData = ExecCommand(port, command, 300, "Failed to accept phoneNo");
        //        command = Message + char.ConvertFromUtf32(26) + "\r";
        //        recievedData = ExecCommand(port, command, 3000, "Failed to send message"); //3 seconds
        //        if (recievedData.EndsWith("\r\nOK\r\n"))
        //        {
        //            isSend = true;
        //        }
        //        else if (recievedData.Contains("ERROR"))
        //        {
        //            isSend = false;
        //        }
        //        return isSend;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }

        //}     
    }
}