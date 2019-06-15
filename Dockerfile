FROM mcr.microsoft.com/dotnet/core/aspnet:2.1-stretch-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:2.1-stretch AS build
WORKDIR /src
COPY ["aks.csproj", ""]
RUN dotnet restore "aks.csproj"
COPY . .
WORKDIR "/src/"
RUN dotnet build "aks.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "aks.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "aks.dll"]