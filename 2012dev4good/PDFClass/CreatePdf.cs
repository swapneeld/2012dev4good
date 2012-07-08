using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
 using iTextSharp.text;
using System.Data;
    using iTextSharp.text.pdf;
 using System.Web;
namespace _2012dev4good.Controllers
{
    
    /// <summary>

    /// Create Pdf using iTextSharp.

    /// </summary>

    /// <remarks>

    /// Uses a dataset, and creates a table per DataTable. The DataTable name and column names are used as page header and table headers.

    /// </remarks>

    public class CreatePdf
    {

        /// <summary>

        /// Initializes a new instance of the <see cref="CreatePdf"/> class.

        /// </summary>

        /// <param name="ds">The dataset containing one or more datatables.</param>

        /// <param name="name">The filename and pdf title.</param>

    



        private readonly DataSet ds;

        private readonly string name;



        public static void Execute(CreativeDetail BookDetails)
        {

            HttpResponse Response = HttpContext.Current.Response;

            Response.Clear();
           
            Response.ContentType = "application/octet-stream";

            Response.AddHeader("Content-Disposition", "attachment; filename="+ BookDetails.Title  +".pdf");

            // step 1: creation of a document-object

            Document document = new Document(PageSize.A4, 10, 10, 90, 10);



            // step 2: we create a writer that listens to the document

            PdfWriter writer = PdfWriter.GetInstance(document, Response.OutputStream);

            int userid = Convert.ToInt32(BookDetails.UserId);

            //set some header stuff

            document.AddTitle(BookDetails.Title);

            document.AddAuthor(new CMEntities().Users.SingleOrDefault(e => e.UserId ==userid).LoginName);

            Paragraph P = new Paragraph(BookDetails.Body); 
            // step 3: we open the document

            document.Open();
            document.Add(P);
            // step 4: we add content to the document
            


            // step 5: we close the document

            document.Close();
            Response.End();
        }



   
        
    }
}