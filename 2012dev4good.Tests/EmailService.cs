using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Net.Configuration;


namespace _2012dev4good.Tests
{
    /// <summary>
    /// Summary description for UnitTest1
    /// </summary>
    [TestClass]
    public class EmailService
    {
        public EmailService()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        //
        // You can use the following additional attributes as you write your tests:
        //
        // Use ClassInitialize to run code before running the first test in the class
        // [ClassInitialize()]
        // public static void MyClassInitialize(TestContext testContext) { }
        //
        // Use ClassCleanup to run code after all tests in a class have run
        // [ClassCleanup()]
        // public static void MyClassCleanup() { }
        //
        // Use TestInitialize to run code before running each test 
        // [TestInitialize()]
        // public void MyTestInitialize() { }
        //
        // Use TestCleanup to run code after each test has run
        // [TestCleanup()]
        // public void MyTestCleanup() { }
        //
        #endregion

        [Ignore]
        [TestMethod]
        public void SendEmail_WhenCalled_SendsEmail()
        {
            //Arrange

            var MyUserName = "TEST";
            var ModeratorName = "SendEmail_WhenCalled_SendsEmail"; 
            var ModeratorAddress = "dev4good2012@gmail.com";  
            var ContentID = System.Guid.NewGuid().ToString();

            //the link that the moderator will click on to view the content and approve it
            var ModeratorLink = "www.bbc.co.uk";

            //email text
            var Subject = "Test Subject";
            var Body = String.Format("<html><body><h1>Hello World</h1></body></html>", ModeratorName, MyUserName, ModeratorLink);

            //Act
            //send the email

            //SmtpSection SMTPSettings = new SmtpSection;
            
            bool actual = Services.Email.SendEmail(ModeratorName, ModeratorAddress, Subject, Body);

            //Assert
            Assert.AreEqual(actual, true);
            
        }
    }
}
