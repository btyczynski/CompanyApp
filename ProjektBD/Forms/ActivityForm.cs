using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;

using System.Windows.Forms;
using System.Threading;
using System.Threading.Tasks;

using MongoDB.Bson;
using MongoDB.Driver;

namespace ProjektBD.Forms
{
    public partial class ActivityForm : Form
    {
        private MongoClient mongoClient;
        private IMongoDatabase mongoDatabase;

        public class Activity
        {
            public ObjectId Id { get; set; }
            public int TaskId { get; set; }
            public string Title { get; set; }
        }

        public ActivityForm()
        {
            InitializeComponent();

            // Mongodb
            this.mongoClient = new MongoClient("mongodb://127.17.0.2:27017");
            this.mongoClient.DropDatabase("companyproject"); // for tests
            this.mongoDatabase = this.mongoClient.GetDatabase("companyproject");

            // Collection
            var collection = this.mongoDatabase.GetCollection<Activity>("activity");
            collection.InsertOne(new Activity{ TaskId = 1, Title = "Uzytkownik Pawel zakonczyl zadanie" });
            collection.InsertOne(new Activity { TaskId = 1, Title = "Uzytkownik Kacper skomentowal zadanie" });
            collection.InsertOne(new Activity { TaskId = 1, Title = "Uzytkownik Pawel ponownie otworzyl zadanie" });
            collection.InsertOne(new Activity { TaskId = 2, Title = "Uzytkownik Michal zakonczyl zadanie" });

            var documents = collection.Find(Builders<Activity>.Filter.Empty).ToListAsync();
            dataGridView1.DataSource = documents.Result;
        }

    }
}
