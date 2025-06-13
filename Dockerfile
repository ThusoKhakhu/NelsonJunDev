FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy only the project file first and restore dependencies
COPY ["NelsonJunDev/NelsonJunDev.csproj", "./"]
RUN dotnet restore "NelsonJunDev.csproj"

# Copy everything else and build
COPY . .
RUN dotnet publish "NelsonJunDev.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "NelsonJunDev.dll"]
