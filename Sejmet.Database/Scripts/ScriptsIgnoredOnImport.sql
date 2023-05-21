
USE [SejmetDB]
GO

SET IDENTITY_INSERT [dbo].[DosageForms] ON
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (1, N'Aerosol')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (2, N'Capsula con cubierta enterica')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (3, N'Capsula de liberacion prolongada')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (4, N'Comprimido con cubierta simple')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (5, N'Comprimido con cubierta enterica')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (6, N'Comprimido de liberacion prolongada')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (7, N'Crema')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (8, N'Emulsion')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (9, N'Extracto')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (10, N'Gel')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (11, N'Pellets')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (12, N'Inyectable')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (13, N'Ovulos')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (14, N'Pasta')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (15, N'Pastilla')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (16, N'Polvo')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (17, N'Pomada')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (18, N'Solucion oftalmica')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (19, N'Suspension oftalmica')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (20, N'Ungüento oftalmico')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (21, N'Sistema de liberacion transdermico')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (22, N'Sistema de liberacion ocular')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (23, N'Sistema de liberacion intrauterino')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (24, N'Solucion oral')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (25, N'Solucion oftálmica')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (26, N'Solucion tópica')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (27, N'Solucion ótica')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (28, N'Tintura')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (29, N'Supositorio')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (30, N'Suspension oral')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (31, N'Suspension tópica')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (32, N'Suspension ótica')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (33, N'Suspension oftálmica')
GO

INSERT [dbo].[DosageForms] ([ID], [Name]) VALUES (34, N'Ungüento')
GO

SET IDENTITY_INSERT [dbo].[DosageForms] OFF
GO

SET IDENTITY_INSERT [dbo].[TherapeuticEffects] ON
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (1, N'Antipiretico')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (2, N'Analgesico')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (3, N'Antiinflamatorio')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (4, N'Antiemetico')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (5, N'Antivertiginoso')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (6, N'Antiflatulento')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (7, N'Antidiarreico')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (8, N'Antiespasmodico')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (9, N'Digestivo')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (10, N'Laxante')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (11, N'Antihistaminico')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (12, N'Expectorante')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (13, N'Corticoide')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (14, N'Hipotensor')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (15, N'Hipolipemiante')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (16, N'Antiinfeccioso Local')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (17, N'Diuretico')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (18, N'Antibiotico')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (19, N'Antimicotico')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (20, N'Antiviral')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (21, N'Antianemico')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (22, N'Antiseptico')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (23, N'Desinfectante')
GO

INSERT [dbo].[TherapeuticEffects] ([ID], [Name]) VALUES (24, N'Anestesico')
GO

SET IDENTITY_INSERT [dbo].[TherapeuticEffects] OFF
GO

INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'7d32580b-c9b1-421c-9db1-0a29b3225bf0', N'Diclofenac Sodico', 150, 1)
GO

INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'd7060fec-ca61-48f8-b52a-14a866e6bc5f', N'Ácido Acetilsalicílico', 4000, 2)
GO

INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'384e5070-aae8-4b3a-a27c-34746076d0dd', N'Ondansetrón', 32, 4)
GO

INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'5517b64f-c060-4507-be82-48ab78b7eab4', N'Metoclopramida', 30, 4)
GO

INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'3821d167-5401-4cf5-8311-520ff1330372', N'Ibuprofeno', 2400, 2)
GO

INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'd6ad61eb-22e9-4f74-8f2f-66468a3114d8', N'Paracetamol', 4000, 3)
GO

INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'638baecb-e3fe-4a54-b3b4-a4b97601fe31', N'Domperidona', 30, 4)
GO

INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'c3f3bbd8-9f17-44b8-8340-be92ed23b4be', N'Ketorolac Trometamina', 90, 3)
GO

INSERT [dbo].[ActiveCompounds] ([ID], [Name], [MaxDosage], [TherapeuticEffectID]) VALUES (N'88f96bbc-cd27-40b2-a1e9-dd20ca2426bb', N'Simeticona', 480, 6)
GO
