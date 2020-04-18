using Model.EF;
using Model.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Mapper
{
    public class SpecificationsMapper
    {
        public static void mobileMapper(Specification mobile, SpecificationsMobile smobile, SpecificationMobile entity)
        {
            mobile.os = entity.Specification.os;
            mobile.ram = entity.Specification.ram;
            mobile.screen = entity.Specification.screen;
            mobile.cpu = entity.Specification.cpu;
            smobile.internalmemory = entity.SpecificationsMobile.internalmemory;
            smobile.memorystick = entity.SpecificationsMobile.memorystick;
            smobile.sim = entity.SpecificationsMobile.sim;
            smobile.batery = entity.SpecificationsMobile.batery;
            smobile.backcamera = entity.SpecificationsMobile.backcamera;
            smobile.frontcamera = entity.SpecificationsMobile.frontcamera;
        }

        public static void laptopMapper(Specification laptop, SpecificationsLaptop slaptop, SpecificationLaptop entity)
        {
            laptop.os = entity.Specification.os;
            laptop.ram = entity.Specification.ram;
            laptop.screen = entity.Specification.screen;
            laptop.cpu = entity.Specification.cpu;
            slaptop.cardscreen = entity.SpecificationsLaptop.cardscreen;
            slaptop.connector = entity.SpecificationsLaptop.connector;
            slaptop.harddrive = entity.SpecificationsLaptop.harddrive;
            slaptop.design = entity.SpecificationsLaptop.design;
            slaptop.size = entity.SpecificationsLaptop.size;
            slaptop.release = entity.SpecificationsLaptop.release;
        }
    }
}
