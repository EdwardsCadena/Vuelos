using Microsoft.AspNetCore.Mvc;
using System;
using Vuelos.Data;
using Vuelos.Dtos;
using Vuelos.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Vuelos.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AvionController : ControllerBase
    {
        private readonly AvionRepositroy _repository;

        public AvionController(AvionRepositroy repository)
        {
            this._repository = repository ?? throw new ArgumentNullException(nameof(repository));
        }

        // GET: api/<AvionController>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Avion>>> Get()
        {
            return await _repository.GetAll();
        }

        // GET api/<AvionController>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Avion>> Get(int id)
        {
            var response = await _repository.GetbyId(id);
            if (response == null) { return NotFound(); }
            return response;
        }

        // POST api/<AvionController>
        [HttpPost]
        public async Task Post([FromBody] Avion avion)
        {
            await _repository.Insert(avion);
        }

        // PUT api/<AvionController>/5
        [HttpPut("{id}")]
        public async Task Put(int id, DtosAvion avion)
        {
            Avion update = new ()
            {
                IdAvion = id,
                Nombre = avion.Nombre,
                Descripcion = avion.Descripcion,
                Motor = avion.Motor,
                Estado = avion.Estado,
                FechaCompra = avion.FechaCompra,
                FechaSalida = avion.FechaSalida
            };
            
            await _repository.Update(update);
        }

        // DELETE api/<AvionController>/5
        [HttpDelete("{id}")]
        public async Task Delete(int id)
        {
            await _repository.DeleteId(id);
        }
    }
}
