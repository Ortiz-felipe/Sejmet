using FluentValidation.AspNetCore;
using MediatR.Extensions.FluentValidation.AspNetCore;
using Microsoft.OpenApi.Models;
using Sejmet.API.Repositories;
using Sejmet.API.Repositories.Interfaces;

var builder = WebApplication.CreateBuilder(args);

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

builder.Services.AddMediatR(config => config.RegisterServicesFromAssemblyContaining<Program>());
builder.Services.AddFluentValidationAutoValidation();
builder.Services.AddDbContext<SejmetDbContext>();
builder.Services.AddAutoMapper(typeof(Program));
builder.Services.AddScoped<ICustomersRepository, CustomersRepository>();
builder.Services.AddScoped<IHealthcareProvidersRepository, HealthcareProvidersRepository>();
builder.Services.AddScoped<IProductsRepository, ProductsRepository>();
builder.Services.AddScoped<ILaboratoriesRepository, LaboratoriesRepository>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
