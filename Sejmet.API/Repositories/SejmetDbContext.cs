using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Sejmet.API.Models.Entities;

namespace Sejmet.API.Repositories;

public partial class SejmetDbContext : DbContext
{
    public SejmetDbContext()
    {
    }

    public SejmetDbContext(DbContextOptions<SejmetDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<ActiveCompound> ActiveCompounds { get; set; }

    public virtual DbSet<City> Cities { get; set; }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<DosageForm> DosageForms { get; set; }

    public virtual DbSet<HealthcareProvider> HealthcareProviders { get; set; }

    public virtual DbSet<Laboratory> Laboratories { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<OrderProduct> OrderProducts { get; set; }

    public virtual DbSet<Product> Products { get; set; }

    public virtual DbSet<Provider> Providers { get; set; }

    public virtual DbSet<Province> Provinces { get; set; }

    public virtual DbSet<Sale> Sales { get; set; }

    public virtual DbSet<SaleProduct> SaleProducts { get; set; }

    public virtual DbSet<TherapeuticEffect> TherapeuticEffects { get; set; }

    public virtual DbSet<TransactionStatus> TransactionStatuses { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Name=ConnectionStrings:SejmetDB");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<ActiveCompound>(entity =>
        {
            entity.Property(e => e.Id)
                .HasDefaultValueSql("(newid())")
                .HasColumnName("ID");
            entity.Property(e => e.Name).HasMaxLength(200);
            entity.Property(e => e.TherapeuticEffectId).HasColumnName("TherapeuticEffectID");

            entity.HasOne(d => d.TherapeuticEffect).WithMany(p => p.ActiveCompounds)
                .HasForeignKey(d => d.TherapeuticEffectId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ActiveCompounds_TherapeuticEffects");
        });

        modelBuilder.Entity<City>(entity =>
        {
            entity.Property(e => e.Id)
                .HasDefaultValueSql("(newid())")
                .HasColumnName("ID");
            entity.Property(e => e.Name).HasMaxLength(50);
            entity.Property(e => e.ProvinceId).HasColumnName("ProvinceID");

            entity.HasOne(d => d.Province).WithMany(p => p.Cities)
                .HasForeignKey(d => d.ProvinceId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Cities_Provinces");
        });

        modelBuilder.Entity<Customer>(entity =>
        {
            entity.Property(e => e.Id)
                .HasDefaultValueSql("(newid())")
                .HasColumnName("ID");
            entity.Property(e => e.Address).HasMaxLength(50);
            entity.Property(e => e.CityId).HasColumnName("CityID");
            entity.Property(e => e.Dni)
                .HasMaxLength(50)
                .HasColumnName("DNI");
            entity.Property(e => e.FirstName).HasMaxLength(100);
            entity.Property(e => e.HealtcareProviderId).HasColumnName("HealtcareProviderID");
            entity.Property(e => e.LastName).HasMaxLength(100);
            entity.Property(e => e.PhoneNumber).HasMaxLength(50);
            entity.Property(e => e.ProvinceId).HasColumnName("ProvinceID");

            entity.HasOne(d => d.City).WithMany(p => p.Customers)
                .HasForeignKey(d => d.CityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Customers_Cities");

            entity.HasOne(d => d.HealtcareProvider).WithMany(p => p.Customers)
                .HasForeignKey(d => d.HealtcareProviderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Customers_HealthcareProviders");

            entity.HasOne(d => d.Province).WithMany(p => p.Customers)
                .HasForeignKey(d => d.ProvinceId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Customers_Provinces");
        });

        modelBuilder.Entity<DosageForm>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Name).HasMaxLength(100);
        });

        modelBuilder.Entity<HealthcareProvider>(entity =>
        {
            entity.Property(e => e.Id)
                .HasDefaultValueSql("(newid())")
                .HasColumnName("ID");
            entity.Property(e => e.Name).HasMaxLength(50);
        });

        modelBuilder.Entity<Laboratory>(entity =>
        {
            entity.Property(e => e.Id)
                .HasDefaultValueSql("(newid())")
                .HasColumnName("ID");
            entity.Property(e => e.Name).HasMaxLength(100);
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.Property(e => e.Id)
                .HasDefaultValueSql("(newid())")
                .HasColumnName("ID");
            entity.Property(e => e.ProviderId).HasColumnName("ProviderID");
            entity.Property(e => e.TotalAmount).HasColumnType("decimal(19, 4)");
            entity.Property(e => e.TransactionStatusId).HasColumnName("TransactionStatusID");

            entity.HasOne(d => d.Provider).WithMany(p => p.Orders)
                .HasForeignKey(d => d.ProviderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Orders_Providers");

            entity.HasOne(d => d.TransactionStatus).WithMany(p => p.Orders)
                .HasForeignKey(d => d.TransactionStatusId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Orders_TransactionStatuses");
        });

        modelBuilder.Entity<OrderProduct>(entity =>
        {
            entity.HasKey(e => new { e.OrderId, e.ProductId });

            entity.Property(e => e.OrderId).HasColumnName("OrderID");
            entity.Property(e => e.ProductId).HasColumnName("ProductID");
            entity.Property(e => e.UnitPrice).HasColumnType("decimal(19, 4)");

            entity.HasOne(d => d.Order).WithMany(p => p.OrderProducts)
                .HasForeignKey(d => d.OrderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_OrderProducts_Orders");

            entity.HasOne(d => d.Product).WithMany(p => p.OrderProducts)
                .HasForeignKey(d => d.ProductId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_OrderProducts_Products");
        });

        modelBuilder.Entity<Product>(entity =>
        {
            entity.Property(e => e.Id)
                .HasDefaultValueSql("(newid())")
                .HasColumnName("ID");
            entity.Property(e => e.ActiveCompoundId).HasColumnName("ActiveCompoundID");
            entity.Property(e => e.DosageFormId).HasColumnName("DosageFormID");
            entity.Property(e => e.LaboratoryId).HasColumnName("LaboratoryID");
            entity.Property(e => e.Price).HasColumnType("decimal(19, 4)");
            entity.Property(e => e.TradeName).HasMaxLength(150);
            entity.Property(e => e.Upc)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("UPC");

            entity.HasOne(d => d.ActiveCompound).WithMany(p => p.Products)
                .HasForeignKey(d => d.ActiveCompoundId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Products_ActiveCompounds");

            entity.HasOne(d => d.DosageForm).WithMany(p => p.Products)
                .HasForeignKey(d => d.DosageFormId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Products_DosageForms");

            entity.HasOne(d => d.Laboratory).WithMany(p => p.Products)
                .HasForeignKey(d => d.LaboratoryId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Products_Laboratories");
        });

        modelBuilder.Entity<Provider>(entity =>
        {
            entity.Property(e => e.Id)
                .HasDefaultValueSql("(newid())")
                .HasColumnName("ID");
            entity.Property(e => e.Address).HasMaxLength(150);
            entity.Property(e => e.CityId).HasColumnName("CityID");
            entity.Property(e => e.Cuit)
                .HasMaxLength(50)
                .HasColumnName("CUIT");
            entity.Property(e => e.Name).HasMaxLength(200);
            entity.Property(e => e.PointOfContact).HasMaxLength(150);
            entity.Property(e => e.ProvinceId).HasColumnName("ProvinceID");

            entity.HasOne(d => d.City).WithMany(p => p.Providers)
                .HasForeignKey(d => d.CityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Providers_Cities");

            entity.HasOne(d => d.Province).WithMany(p => p.Providers)
                .HasForeignKey(d => d.ProvinceId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Providers_Provinces");
        });

        modelBuilder.Entity<Province>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Name).HasMaxLength(50);
        });

        modelBuilder.Entity<Sale>(entity =>
        {
            entity.Property(e => e.Id)
                .HasDefaultValueSql("(newid())")
                .HasColumnName("ID");
            entity.Property(e => e.CustomerId).HasColumnName("CustomerID");
            entity.Property(e => e.TotalAmount).HasColumnType("decimal(19, 4)");
            entity.Property(e => e.TransactionStatusId).HasColumnName("TransactionStatusID");

            entity.HasOne(d => d.Customer).WithMany(p => p.Sales)
                .HasForeignKey(d => d.CustomerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Sales_Customers");

            entity.HasOne(d => d.TransactionStatus).WithMany(p => p.Sales)
                .HasForeignKey(d => d.TransactionStatusId)
                .HasConstraintName("FK_Sales_TransactionStatuses");
        });

        modelBuilder.Entity<SaleProduct>(entity =>
        {
            entity.HasKey(e => new { e.SaleId, e.ProductId });

            entity.Property(e => e.SaleId).HasColumnName("SaleID");
            entity.Property(e => e.ProductId).HasColumnName("ProductID");
            entity.Property(e => e.UnitPrice).HasColumnType("decimal(19, 4)");

            entity.HasOne(d => d.Product).WithMany(p => p.SaleProducts)
                .HasForeignKey(d => d.ProductId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_SaleProducts_Products1");

            entity.HasOne(d => d.Sale).WithMany(p => p.SaleProducts)
                .HasForeignKey(d => d.SaleId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_SaleProducts_Sales1");
        });

        modelBuilder.Entity<TherapeuticEffect>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Name).HasMaxLength(100);
        });

        modelBuilder.Entity<TransactionStatus>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.Name).HasMaxLength(50);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
