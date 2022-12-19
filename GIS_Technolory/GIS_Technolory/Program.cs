using GIS_Technolory.DBAccess;
using GIS_Technolory.Serivces;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

ConnectionService.Set(builder.Configuration);
builder.Services.AddDbContext<GISContext>(options => options.UseSqlServer(ConnectionService.connstring)
.LogTo(Console.WriteLine, LogLevel.Information));

builder.Services.AddTransient<ITypeMarkerService, TypeMarkerService>();
builder.Services.AddTransient<ITypePolylineService, TypePolylineService>();

builder.Services.AddControllers().AddNewtonsoftJson(opt =>
{
    opt.UseMemberCasing(); // Prevent camelCasing Response
    opt.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
});

builder.Services.AddControllers().AddJsonOptions(options =>
{
    options.JsonSerializerOptions.PropertyNamingPolicy = null; // Prevent camelCasing input
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
