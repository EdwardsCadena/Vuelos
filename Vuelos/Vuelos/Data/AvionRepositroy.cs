using Microsoft.VisualBasic;
using System.Data.SqlClient;
using Vuelos.Models;

namespace Vuelos.Data
{
    public class AvionRepositroy
    {
        private readonly string _connectionString;

        public AvionRepositroy(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("defaultConnection");
        }
        public async  Task<List<Avion>> GetAll()
        {
            try
            {
                using (SqlConnection sql = new SqlConnection(_connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_GetAvionAll", sql))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        var response = new List<Avion>();
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
        private Avion MapToValue(SqlDataReader reader)
        {
            return new Avion()
            {
                IdAvion = (int)reader["IdAvion"],
                Nombre = reader["Nombre"].ToString(),
                Descripcion = reader["Descripcion"].ToString(),
                Motor = reader["Motor"].ToString(),
                Estado = (bool)reader["Estado"],
                FechaRegistro = reader["FechaRegistro"] is DBNull ? null : (DateTime)reader["FechaRegistro"],
                FechaCompra = reader["FechaCompra"] is DBNull ? null : (DateTime)reader["FechaCompra"],
                FechaSalida = reader["FechaSalida"] is DBNull ? null : (DateTime)reader["FechaSalida"] 
            };
        }
        public async Task<Avion> GetbyId(int id)
        {
            try
            {
                using (SqlConnection sql = new SqlConnection(_connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_getAvion", sql))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@IdAvion", id));
                        Avion response = null;
                        await sql.OpenAsync();

                        using (var reader = await cmd.ExecuteReaderAsync())
                        {
                            while (await reader.ReadAsync())
                            {
                                response = MapToValue(reader);
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
        public async Task Insert(Avion avion)
        {
            try
            {
                using (SqlConnection sql = new SqlConnection(_connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_addAvion", sql))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@Nombre", avion.Nombre));
                        cmd.Parameters.Add(new SqlParameter("@Descripcion", avion.Descripcion));
                        cmd.Parameters.Add(new SqlParameter("@Motor", avion.Motor));
                        cmd.Parameters.Add(new SqlParameter("@Estado", avion.Estado));
                        cmd.Parameters.Add(new SqlParameter("@FechaRegistro", avion.FechaRegistro));
                        cmd.Parameters.Add(new SqlParameter("@FechaCompra", avion.FechaCompra));
                        cmd.Parameters.Add(new SqlParameter("@FechaSalida", avion.FechaSalida));
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
        public async Task Update(Avion avion)
        {
            try
            {
                using (SqlConnection sql = new SqlConnection(_connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_updateAvion", sql))
                    {

                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@IdAvion", avion.IdAvion));
                        cmd.Parameters.Add(new SqlParameter("@Nombre", avion.Nombre));
                        cmd.Parameters.Add(new SqlParameter("@Descripcion", avion.Descripcion));
                        cmd.Parameters.Add(new SqlParameter("@Motor", avion.Motor));
                        cmd.Parameters.Add(new SqlParameter("@Estado", avion.Estado));
                        cmd.Parameters.Add(new SqlParameter("@FechaCompra", avion.FechaCompra));
                        cmd.Parameters.Add(new SqlParameter("@FechaSalida", avion.FechaSalida));
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
        public async Task DeleteId(int id)
        {
            try
            {
                using (SqlConnection sql = new SqlConnection(_connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_DeleteAvion", sql))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@IdAvion", id));
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

        public static implicit operator AvionRepositroy(SpRepository v)
        {
            throw new NotImplementedException();
        }
    }
}
