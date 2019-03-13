using DoddleReport;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProjektBD.Forms
{
    public partial class AddressForm : Form
    {
        private CompanyModelContainer ctx;

        private int operation = 0;

        public AddressForm()
        {
            ctx = new CompanyModelContainer();

            // Components
            InitializeComponent();
            textBox1.Enabled = false;
            textBox2.Enabled = false;
            textBox3.Enabled = false;
            textBox4.Enabled = false;
            textBox5.Enabled = false;
            textBox6.Enabled = false;

            dataGridView1.DataSource = ctx.Addresses.ToList();
            dataGridView2.DataSource = ctx.V_CityCount.ToList();
        }
        
        private void button2_Click(object sender, EventArgs e)
        {
            label7.Text = "Adding";

            operation = 1;
            clear();
            textBox1.Enabled = false;
            textBox2.Enabled = true;
            textBox3.Enabled = true;
            textBox4.Enabled = true;
            textBox5.Enabled = true;
            textBox6.Enabled = true;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            label7.Text = "Removing";

            operation = 2;
            clear();
            textBox1.Enabled = true;
            textBox2.Enabled = false;
            textBox3.Enabled = false;
            textBox4.Enabled = false;
            textBox5.Enabled = false;
            textBox6.Enabled = false;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            label7.Text = "Changing";

            operation = 3;
            clear();
            textBox1.Enabled = false;
            textBox2.Enabled = false;
            textBox3.Enabled = false;
            textBox4.Enabled = false;
            textBox5.Enabled = false;
            textBox6.Enabled = false;
        }

        private void dataGridView1_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                switch (operation)
                {
                    case 2:
                        insertRowToInputs(e.RowIndex);
                        break;
                    case 3:
                        textBox2.Enabled = true;
                        textBox3.Enabled = true;
                        textBox4.Enabled = true;
                        textBox5.Enabled = true;
                        textBox6.Enabled = true;

                        insertRowToInputs(e.RowIndex);
                        break;
                    default:
                        break;
                }

            }

        }

        private void insertRowToInputs(int row)
        {
            textBox1.Text = dataGridView1[0, row].Value.ToString();
            textBox2.Text = dataGridView1[1, row].Value.ToString();
            textBox3.Text = dataGridView1[2, row].Value.ToString();
            textBox4.Text = dataGridView1[3, row].Value.ToString();
            textBox5.Text = dataGridView1[4, row].Value.ToString();
            textBox6.Text = dataGridView1[5, row].Value.ToString();
        }

        private void clear()
        {
            textBox1.Text = "";
            textBox2.Text = "";
            textBox3.Text = "";
            textBox4.Text = "";
            textBox5.Text = "";
            textBox6.Text = "";
        }

        // From Procedure
        private void button5_Click(object sender, EventArgs e)
        {
            execute(2);
        }

        // From Code
        private void button1_Click_1(object sender, EventArgs e)
        {
            execute(1);
        }

        private void execute(int from)
        {
            int retCode = 0;

            try
            {
                switch (operation)
                {
                    // Add new
                    case 1:
                        // From code
                        if (from == 1)
                        {
                            var adr = new Address
                            {
                                Street = textBox2.Text,
                                Number = Convert.ToInt16(textBox3.Text),
                                Code = textBox4.Text,
                                City = textBox5.Text,
                                Country = textBox6.Text
                            };

                            var q3 = from st in ctx.Addresses select st;

                           foreach (var s in q3)
                                if (s.Street == adr.Street)
                                    if (s.Number == adr.Number)
                                        if (s.Code == adr.Code)
                                            if (s.City == adr.City)
                                                if (s.Country == adr.Country)
                                                {
                                                    throw new Exception("Istneje już taki adres");
                                                }

                            ctx.Addresses.Add(adr);
                        }
                        // From procedure
                        else
                        {
                            retCode = ctx.InsertAddress(textBox2.Text, Convert.ToInt16(textBox3.Text), textBox4.Text, textBox5.Text, textBox6.Text);
                        }
                        
                        break;

                    // Remove
                    case 2:
                        if (from == 1)
                        {
                            var adrList = ctx.Addresses.ToList();
                            ctx.Addresses.Remove(adrList.Where(s => s.ID == Convert.ToInt16(textBox1.Text)).FirstOrDefault<Address>());
                        }
                        else
                        {
                            retCode = ctx.DeleteAddress(Convert.ToInt16(textBox1.Text));
                        }
                        break;

                    // Update
                    case 3:

                        if (from == 1)
                        {
                            var adrList = ctx.Addresses.ToList();

                            var address = adrList.Where(s => s.ID == Convert.ToInt16(textBox1.Text)).FirstOrDefault<Address>();
                            address.Street = textBox2.Text;
                            address.Number = Convert.ToInt16(textBox3.Text);
                            address.Code = textBox4.Text;
                            address.City = textBox5.Text;
                            address.Country = textBox6.Text;
                        }
                        else
                        {
                            // Obsluga wspolbieznosci optymistycznej
                            var adrList = ctx.Addresses.ToList();
                            var address = adrList.Where(s => s.ID == Convert.ToInt16(textBox1.Text)).FirstOrDefault<Address>();

                            try
                            {
                                ctx.Entry(address).State = EntityState.Modified;
                                retCode = ctx.UpdateAddress(Convert.ToInt16(textBox1.Text), textBox2.Text, Convert.ToInt16(textBox3.Text), textBox4.Text, textBox5.Text, textBox6.Text);

                                ctx.SaveChanges();
                                Console.WriteLine("Aktualizacja adresu");
                            }
                            catch (DbUpdateConcurrencyException ex)
                            {
                                Console.WriteLine("Aktualizacja adresu nie powiodla sie: Optimistic Concurrency exception");
                            }

                        }

                        break;
                }

                clear();

                ctx.SaveChanges();

                if (from == 2)
                {
                    ctx = new CompanyModelContainer();
                    MessageBox.Show("Zwrocony przez procedure kod: " + retCode, "Zwrocony kod");
                }



                dataGridView1.DataSource = ctx.Addresses.ToList();
                dataGridView2.DataSource = ctx.V_CityCount.ToList();

            }
            catch (DbEntityValidationException ex)
            {
                var errorMessages = ex.EntityValidationErrors
                .SelectMany(x => x.ValidationErrors)
                .Select(x => x.ErrorMessage);
                // Join the list to a single string.

                var fullErrorMessage = string.Join("; ", errorMessages);

                MessageBox.Show(fullErrorMessage);
            }
            //System.Data.SqlClient.SqlException
            catch (System.Data.Entity.Core.EntityCommandExecutionException ex)
            {
                if (ex.InnerException == null)
                    MessageBox.Show("Blad.", "Nieprawidlowe dane adresu!");
                else
                    MessageBox.Show(ex.InnerException.Message);
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.GetType().ToString());
                if (ex.InnerException == null)
                    MessageBox.Show("Blad.", "Nieprawidlowe dane adresu!");
                else
                    MessageBox.Show(ex.InnerException.InnerException.Message);
            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            saveFileDialog1.ShowDialog();

            if (saveFileDialog1.FileName != "")
            {
                FileStream fs = (FileStream) saveFileDialog1.OpenFile();

                var report = new Report(ctx.V_CityCount.ToReportSource());

                report.TextFields.Title = "Raport miast w tabeli adresy";
                report.TextFields.SubTitle = "Liczba adresów z poszczególnych miast";

                var writer = new DoddleReport.iTextSharp.PdfReportWriter();
                writer.WriteReport(report, fs);
            }
        }
    }
}
