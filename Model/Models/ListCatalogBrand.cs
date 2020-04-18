
using Model.Dao;
using Model.EF;
using System.Collections.Generic;
using System.Web.Mvc;

namespace Model.Models
{
    public class ListCatalogBrand
    {
        public List<SelectListItem> listBrand { get; set; }
        public ListCatalogBrand()
        {
            var dao = new CatalogDao();
            listBrand = new List<SelectListItem>();
            foreach(CatalogBrand cb in dao.getAllBrand())
            {
                listBrand.Add(new SelectListItem
                {
                    Value = cb.id.ToString(),
                    Text = cb.brand
                });
            }
        }
    }
}
