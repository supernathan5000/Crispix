﻿using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(crispix2._0.Startup))]
namespace crispix2._0
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
