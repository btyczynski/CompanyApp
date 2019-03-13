
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/22/2017 14:51:38
-- Generated from EDMX file: C:\Users\macie\source\repos\ProjektBD\ProjektBD\CompanyModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DBCompany];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__Project__ID_Comp__5DCAEF64]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Project] DROP CONSTRAINT [FK__Project__ID_Comp__5DCAEF64];
GO
IF OBJECT_ID(N'[dbo].[FK__Project__ID_Team__5CD6CB2B]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Project] DROP CONSTRAINT [FK__Project__ID_Team__5CD6CB2B];
GO
IF OBJECT_ID(N'[dbo].[FK__Task__ID_Emp__619B8048]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Task] DROP CONSTRAINT [FK__Task__ID_Emp__619B8048];
GO
IF OBJECT_ID(N'[dbo].[FK__Task__ID_Project__60A75C0F]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Task] DROP CONSTRAINT [FK__Task__ID_Project__60A75C0F];
GO
IF OBJECT_ID(N'[dbo].[FK_AdresEmploye]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK_AdresEmploye];
GO
IF OBJECT_ID(N'[dbo].[FK_ComAdr]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Company] DROP CONSTRAINT [FK_ComAdr];
GO
IF OBJECT_ID(N'[dbo].[FK_ComEmp]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Composition] DROP CONSTRAINT [FK_ComEmp];
GO
IF OBJECT_ID(N'[dbo].[FK_CompEmploye]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Computers] DROP CONSTRAINT [FK_CompEmploye];
GO
IF OBJECT_ID(N'[dbo].[FK_ComTeam]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Composition] DROP CONSTRAINT [FK_ComTeam];
GO
IF OBJECT_ID(N'[dbo].[FK_SalEmploye]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Salary] DROP CONSTRAINT [FK_SalEmploye];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Addresses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Addresses];
GO
IF OBJECT_ID(N'[dbo].[Company]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Company];
GO
IF OBJECT_ID(N'[dbo].[Composition]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Composition];
GO
IF OBJECT_ID(N'[dbo].[Computers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Computers];
GO
IF OBJECT_ID(N'[dbo].[Employees]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employees];
GO
IF OBJECT_ID(N'[dbo].[Project]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Project];
GO
IF OBJECT_ID(N'[dbo].[Salary]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Salary];
GO
IF OBJECT_ID(N'[dbo].[Task]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Task];
GO
IF OBJECT_ID(N'[dbo].[Team]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Team];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Addresses'
CREATE TABLE [dbo].[Addresses] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Street] varchar(255)  NOT NULL,
    [Number] int  NOT NULL,
    [Code] varchar(255)  NOT NULL,
    [City] varchar(255)  NOT NULL,
    [Country] varchar(255)  NOT NULL
);
GO

-- Creating table 'Companies'
CREATE TABLE [dbo].[Companies] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [ID_Adr] int  NOT NULL,
    [Namee] varchar(255)  NOT NULL
);
GO

-- Creating table 'Compositions'
CREATE TABLE [dbo].[Compositions] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [ID_Team] int  NOT NULL,
    [ID_Emp] int  NOT NULL
);
GO

-- Creating table 'Computers'
CREATE TABLE [dbo].[Computers] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [ID_Emp] int  NOT NULL,
    [Destination] varchar(255)  NOT NULL
);
GO

-- Creating table 'Employees'
CREATE TABLE [dbo].[Employees] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [ID_Adr] int  NOT NULL,
    [First_name] varchar(255)  NOT NULL,
    [Last_name] varchar(255)  NOT NULL,
    [Birth] varchar(255)  NOT NULL
);
GO

-- Creating table 'Projects'
CREATE TABLE [dbo].[Projects] (
    [ID] int  NOT NULL,
    [ID_Team] int  NOT NULL,
    [ID_Company] int  NOT NULL,
    [Namee] varchar(255)  NOT NULL,
    [Descriptionn] varchar(255)  NOT NULL,
    [Budget] varchar(255)  NOT NULL,
    [Active] int  NOT NULL
);
GO

-- Creating table 'Salaries'
CREATE TABLE [dbo].[Salaries] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [ID_Emp] int  NOT NULL,
    [Payment] float  NOT NULL,
    [Monthh] int  NOT NULL,
    [Yearr] int  NOT NULL
);
GO

-- Creating table 'Tasks'
CREATE TABLE [dbo].[Tasks] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [ID_Project] int  NOT NULL,
    [ID_Emp] int  NOT NULL,
    [Namee] varchar(255)  NOT NULL,
    [Descriptionn] varchar(255)  NOT NULL,
    [Status] int  NOT NULL
);
GO

-- Creating table 'Teams'
CREATE TABLE [dbo].[Teams] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Namee] varchar(255)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Addresses'
ALTER TABLE [dbo].[Addresses]
ADD CONSTRAINT [PK_Addresses]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Companies'
ALTER TABLE [dbo].[Companies]
ADD CONSTRAINT [PK_Companies]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Compositions'
ALTER TABLE [dbo].[Compositions]
ADD CONSTRAINT [PK_Compositions]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Computers'
ALTER TABLE [dbo].[Computers]
ADD CONSTRAINT [PK_Computers]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [PK_Employees]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [PK_Projects]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Salaries'
ALTER TABLE [dbo].[Salaries]
ADD CONSTRAINT [PK_Salaries]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Tasks'
ALTER TABLE [dbo].[Tasks]
ADD CONSTRAINT [PK_Tasks]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Teams'
ALTER TABLE [dbo].[Teams]
ADD CONSTRAINT [PK_Teams]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ID_Adr] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [FK_AdresEmploye]
    FOREIGN KEY ([ID_Adr])
    REFERENCES [dbo].[Addresses]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdresEmploye'
CREATE INDEX [IX_FK_AdresEmploye]
ON [dbo].[Employees]
    ([ID_Adr]);
GO

-- Creating foreign key on [ID_Adr] in table 'Companies'
ALTER TABLE [dbo].[Companies]
ADD CONSTRAINT [FK_ComAdr]
    FOREIGN KEY ([ID_Adr])
    REFERENCES [dbo].[Addresses]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ComAdr'
CREATE INDEX [IX_FK_ComAdr]
ON [dbo].[Companies]
    ([ID_Adr]);
GO

-- Creating foreign key on [ID_Company] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [FK__Project__ID_Comp__5DCAEF64]
    FOREIGN KEY ([ID_Company])
    REFERENCES [dbo].[Companies]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Project__ID_Comp__5DCAEF64'
CREATE INDEX [IX_FK__Project__ID_Comp__5DCAEF64]
ON [dbo].[Projects]
    ([ID_Company]);
GO

-- Creating foreign key on [ID_Emp] in table 'Compositions'
ALTER TABLE [dbo].[Compositions]
ADD CONSTRAINT [FK_ComEmp]
    FOREIGN KEY ([ID_Emp])
    REFERENCES [dbo].[Employees]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ComEmp'
CREATE INDEX [IX_FK_ComEmp]
ON [dbo].[Compositions]
    ([ID_Emp]);
GO

-- Creating foreign key on [ID_Team] in table 'Compositions'
ALTER TABLE [dbo].[Compositions]
ADD CONSTRAINT [FK_ComTeam]
    FOREIGN KEY ([ID_Team])
    REFERENCES [dbo].[Teams]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ComTeam'
CREATE INDEX [IX_FK_ComTeam]
ON [dbo].[Compositions]
    ([ID_Team]);
GO

-- Creating foreign key on [ID_Emp] in table 'Computers'
ALTER TABLE [dbo].[Computers]
ADD CONSTRAINT [FK_CompEmploye]
    FOREIGN KEY ([ID_Emp])
    REFERENCES [dbo].[Employees]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CompEmploye'
CREATE INDEX [IX_FK_CompEmploye]
ON [dbo].[Computers]
    ([ID_Emp]);
GO

-- Creating foreign key on [ID_Emp] in table 'Tasks'
ALTER TABLE [dbo].[Tasks]
ADD CONSTRAINT [FK__Task__ID_Emp__619B8048]
    FOREIGN KEY ([ID_Emp])
    REFERENCES [dbo].[Employees]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Task__ID_Emp__619B8048'
CREATE INDEX [IX_FK__Task__ID_Emp__619B8048]
ON [dbo].[Tasks]
    ([ID_Emp]);
GO

-- Creating foreign key on [ID_Emp] in table 'Salaries'
ALTER TABLE [dbo].[Salaries]
ADD CONSTRAINT [FK_SalEmploye]
    FOREIGN KEY ([ID_Emp])
    REFERENCES [dbo].[Employees]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalEmploye'
CREATE INDEX [IX_FK_SalEmploye]
ON [dbo].[Salaries]
    ([ID_Emp]);
GO

-- Creating foreign key on [ID_Team] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [FK__Project__ID_Team__5CD6CB2B]
    FOREIGN KEY ([ID_Team])
    REFERENCES [dbo].[Teams]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Project__ID_Team__5CD6CB2B'
CREATE INDEX [IX_FK__Project__ID_Team__5CD6CB2B]
ON [dbo].[Projects]
    ([ID_Team]);
GO

-- Creating foreign key on [ID_Project] in table 'Tasks'
ALTER TABLE [dbo].[Tasks]
ADD CONSTRAINT [FK__Task__ID_Project__60A75C0F]
    FOREIGN KEY ([ID_Project])
    REFERENCES [dbo].[Projects]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Task__ID_Project__60A75C0F'
CREATE INDEX [IX_FK__Task__ID_Project__60A75C0F]
ON [dbo].[Tasks]
    ([ID_Project]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------