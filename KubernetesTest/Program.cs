var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

var pathBases = builder.Configuration["PATH_BASE"];
var app = builder.Build();

if (!string.IsNullOrWhiteSpace(pathBases))
{
    var pathBaseArray = pathBases.Split(";");
    foreach (var pathBase in pathBaseArray)
        app.UsePathBase($"/{pathBase.TrimStart('/')}");
}

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
