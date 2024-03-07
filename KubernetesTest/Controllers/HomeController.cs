using KubernetesTest.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace KubernetesTest.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            _logger.LogWarning("Run HomeController.Index");
            return View();
        }

        public IActionResult Privacy()
        {
            _logger.LogWarning("Run HomeController.Privacy");
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
