using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Office.Tools.Ribbon;
using Outlook = Microsoft.Office.Interop.Outlook;
using Office = Microsoft.Office.Core;
using System.Diagnostics;
using System.Runtime.InteropServices;

namespace VSTO_nadstroyka
{

    public partial class Vigruzki
    {
        private void FirstTabl_Load(object sender, RibbonUIEventArgs e)
        {

        }
        //Рисуем таблицу
        private string Tabl()
        {
            string s;
            s = "<html><body>";
            s = s + "<table width=\"500\" border=\"1\">";
            s = s + "<tr><td bgcolor=\"#DCDCDC\"><b>Цель:</b></td><td width=\"350\"></td></tr>";
            s = s + "<tr><td bgcolor=\"#DCDCDC\"><b>Пул магазинов:</b></td><td width=\"350\"></td></tr>";
            s = s + "<tr><td bgcolor=\"#DCDCDC\"><b>Приоритет:</b></td><td width=\"350\">"+ PrioraTet()+"</td></tr>";
            // s = s + "<form><div><input type=\"radio\" id=\"priora1\"name=\"contact\" value=1><label for=\"priora1\">Средний</label><input type=\"radio\" id=\"priora2\"name=\"contact\" value=2><label for=\"priora2\">Высокий</label><input type=\"radio\" id=\"priora\"name=\"contact\" value=3><label for=\"priora3\">Крайне высокий</label></div></form>";
            s = s + "<tr><td bgcolor=\"#DCDCDC\"><b>Разрез:</b></td><td width=\"350\"></td></tr>";
            s = s + "<tr><td bgcolor=\"#DCDCDC\"><b>Показатель:</b></td><td width=\"350\"></td></tr>";
            s = s + "<tr><td bgcolor=\"#DCDCDC\"><b>Период:</b></td><td width=\"350\"></td></tr>";
            s = s + "<tr><td bgcolor=\"#DCDCDC\"><b>Особенности:</b></td><td width=\"350\"></td></tr>";
            s = s + "<tr><td bgcolor=\"#DCDCDC\"><b>Ранние выгрузки:</b></td><td width=\"350\"></td></tr>";
            //   s = s + "<select><option>Средний</option><option>Высокий</option><option>Очень высокий</option><option>Не срочно</option></select>";
            s = s + "</table></body></html>";
            return s;

        }
        public string PrioraTet()
        {
            string s = "Не задан";
            if (nizkii.Checked == true) s = "Низкий";
            if (normal.Checked == true) s = "Нормальный";
            if (visokii.Checked == true) s = "Высокий";
            return s;
        }
        private void ProverkaCheck(int r)
        {
            if (r==1)
            {
                nizkii.Checked = true;
                normal.Checked = false;
                visokii.Checked = false;
            }
            if (r == 2)
            {
                normal.Checked = true;
                nizkii.Checked = false;
                visokii.Checked = false;
            }
            if (r == 3)
            {
                visokii.Checked = true;
                normal.Checked = false;
                nizkii.Checked = false;
            }
        }
 
        private void button1_Click(object sender, RibbonControlEventArgs e)
        {
 
            var oApp = Globals.ThisAddIn.Application;
            Outlook.Inspector Inspector = oApp.ActiveInspector();
            Outlook.MailItem mailItem = Inspector.CurrentItem as Outlook.MailItem;
            mailItem.HTMLBody = Tabl() + mailItem.HTMLBody;
            mailItem.Display(true);

            /*
             //Тут должно инсертится в табличку на соурсе поступившая задача
             db.ExecuteCommand("UPDATE Products SET UnitPrice = UnitPrice + 1.00");
             */
            /*
             * СОЗДАНИЕ НОВОГО ПИСЬМА
             var oApp = new Outlook.Application();
             Outlook.MailItem mailItem = (Outlook.MailItem)oApp.CreateItem(Outlook.OlItemType.olMailItem) as Outlook.MailItem;
             Outlook.Inspector currentInspector = (Outlook.Inspector)mailItem.GetInspector ;
             mailItem.HTMLBody =  Tabl() + mailItem.Body + mailItem.HTMLBody;
             mailItem.Display(true);
           */
        }

        private void nizkii_Click(object sender, RibbonControlEventArgs e)
        {
            ProverkaCheck(1);
        }

        private void normal_Click(object sender, RibbonControlEventArgs e)
        {
            ProverkaCheck(2);
        }

        private void visokii_Click(object sender, RibbonControlEventArgs e)
        {
            ProverkaCheck(3);
        }
    }
}
