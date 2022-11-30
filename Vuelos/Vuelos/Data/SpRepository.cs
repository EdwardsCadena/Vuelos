using System.Data.SqlClient;
using Vuelos.Models;

namespace Vuelos.Data
{
    public class SpRepository
    {
        private readonly string _connectionString;

        public SpRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("defaultConnection");
        }

        public async Task<List<Intinerariocs>> GetCity()
        {
            try
            {
                using (SqlConnection sql = new SqlConnection(_connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_ConsultadeCiudades", sql))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        var response = new List<Intinerariocs>();
                        await sql.OpenAsync();

                        using (var reader = await cmd.ExecuteReaderAsync())
                        {
                            while (await reader.ReadAsync())
                            {
                                response.Add(MapToValue(reader));
                            }
                        }

                        return response;
                    }

                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public async Task<List<Intinerariocs>> sp_GetVuelosAll()
        {
            try
            {
                using (SqlConnection sql = new SqlConnection(_connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_ConsultadeCiudades", sql))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        var response = new List<Intinerariocs>();
                        await sql.OpenAsync();

                        using (var reader = await cmd.ExecuteReaderAsync())
                        {
                            while (await reader.ReadAsync())
                            {
                                response.Add(MapToValue(reader));
                            }
                        }

                        return response;
                    }

                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        private Intinerariocs MapToValue(SqlDataReader reader)
        {
            return new Intinerariocs()
            {
                IdViaje = (int)reader["IdViaje"],
                NombreVuelo = reader["NombreVuelo"].ToString(),
                Descripcion = reader["Descripcion"].ToString(),
                IdAvion = (int)reader["IdAvion"],
                IdCiudad = (int)reader["IdCiudad"],
                IdDestino = (int)reader["IdDestino"],
                FechaRegistro = reader["FechaRegistro"] is DBNull ? null : (DateTime)reader["FechaRegistro"],
                FechaSalida = reader["FechaSalida"] is DBNull ? null : reader["FechaSalida"] is DBNull ? null : (DateTime)reader["FechaSalida"],
                FechaLlegada = reader["FechaLlegada"] is DBNull ? null : (DateTime)reader["FechaLlegada"],
            };
        }

        public async Task Insert(Intinerariocs intinerariocs)
        {
            try
            {
                using (SqlConnection sql = new SqlConnection(_connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_addVuelo", sql))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@NombreVuelo", intinerariocs.NombreVuelo));
                        cmd.Parameters.Add(new SqlParameter("@Descripcion", intinerariocs.Descripcion));
                        cmd.Parameters.Add(new SqlParameter("@IdAvion", intinerariocs.IdAvion));
                        cmd.Parameters.Add(new SqlParameter("@IdCiudad", intinerariocs.IdCiudad));
                        cmd.Parameters.Add(new SqlParameter("@IdDestino", intinerariocs.IdDestino));
                        cmd.Parameters.Add(new SqlParameter("@FechaRegistro", intinerariocs.FechaRegistro));
                        cmd.Parameters.Add(new SqlParameter("@FechaSalida", intinerariocs.FechaSalida));
                        cmd.Parameters.Add(new SqlParameter("@FechaLlegada", intinerariocs.FechaLlegada));
                        await sql.OpenAsync();
                        await cmd.ExecuteNonQueryAsync();
                        return;
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }

        }

    }
}
