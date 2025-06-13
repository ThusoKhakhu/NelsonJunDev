# Use Microsoft's official build image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy csproj and restore as distinct layers
COPY ["NelsonJunDev/NelsonJunDev.csproj", "NelsonJunDev/"]
RUN dotnet restore "NelsonJunDev/NelsonJunDev.csproj"

# Copy everything else and build
COPY . .
WORKDIR "/src/NelsonJunDev"
RUN dotnet publish "NelsonJunDev.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "NelsonJunDev.dll"]
