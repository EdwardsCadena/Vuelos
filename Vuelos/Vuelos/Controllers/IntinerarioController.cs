using Microsoft.AspNetCore.Mvc;
using System;
using Vuelos.Data;
using Vuelos.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Vuelos.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class IntinerarioController : ControllerBase
    {
        private readonly IntiRepository _repository;

        public IntinerarioController(IntiRepository repository)
        {
            this._repository = repository ?? throw new ArgumentNullException(nameof(repository));
        }
        // GET: api/<IntinerarioController>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Intinerariocs>>> Get()
        {
            return await _repository.GetAll();
        }

        // POST api/<IntinerarioController>
        [HttpPost]
        public async Task Post([FromBody] Intinerariocs intinerariocs)
        {
            await _repository.Insert(intinerariocs);
        }

    }
}
