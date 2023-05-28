using FluentValidation;
using FluentValidation.AspNetCore;
using MediatR.Extensions.FluentValidation.AspNetCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using Sejmet.API.Repositories;
using Sejmet.API.Repositories.Interfaces;

var builder = WebApplication.CreateBuilder(args);
var allowedOrigins = "_allowedOrigins";

// Get Environment Variables for the DB Connection String
//var dbHost = Environment.GetEnvironmentVariable("DB_HOST");
//var dbName = Environment.GetEnvironmentVariable("DB_NAME");
//var dbPassword = Environment.GetEnvironmentVariable("DB_SA_PASSWORD");
//var connectionString = $"Data Source={dbHost};Initial Catalog={dbName};User ID=sa;Password={dbPassword};TrustServerCertificate=True";

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(options =>
{
    options.SwaggerDoc("v1", new OpenApiInfo
    {
        Version = "v1",
        Title = "Sejmet API"
    });
    options.CustomSchemaIds(type => type.FullName);
});

builder.Services.AddCors(options =>
{
    options.AddPolicy(name: allowedOrigins, builder =>
    {
        builder.WithOrigins("*");
        builder.AllowAnyMethod();
        builder.AllowAnyMethod();
    });
});

builder.Services.AddMediatR(config => config.RegisterServicesFromAssemblyContaining<Program>());
builder.Services.AddFluentValidationAutoValidation();
builder.Services.AddValidatorsFromAssemblyContaining<Program>();
//builder.Services.AddDbContext<SejmetDbContext>(options => options.UseSqlServer(connectionString));
builder.Services.AddDbContext<SejmetDbContext>();
builder.Services.AddAutoMapper(typeof(Program));
builder.Services.AddScoped<ICustomersRepository, CustomersRepository>();
builder.Services.AddScoped<IHealthcareProvidersRepository, HealthcareProvidersRepository>();
builder.Services.AddScoped<IProductsRepository, ProductsRepository>();
builder.Services.AddScoped<ILaboratoriesRepository, LaboratoriesRepository>();
builder.Services.AddScoped<ISalesRepository, SalesRepository>();
builder.Services.AddScoped<IOrdersRepository, OrdersRepository>();
builder.Services.AddScoped<IProvincesRepository, ProvincesRepository>();
builder.Services.AddScoped<ICitiesRepository, CitiesRepository>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseCors(allowedOrigins);

app.UseAuthorization();

app.MapControllers();

app.Run();
