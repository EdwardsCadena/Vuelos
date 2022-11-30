using Microsoft.AspNetCore.Mvc;
using Vuelos.Data;
using Vuelos.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Vuelos.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ConsultasController : ControllerBase
    {

        private readonly SpRepository _repository;

        public ConsultasController(SpRepository repository)
        {
            this._repository = repository ?? throw new ArgumentNullException(nameof(repository));
        }
        // GET: api/<ValuesController>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Intinerariocs>>> Get()
        {
            return await _repository.GetCity();
        }


    }
}
