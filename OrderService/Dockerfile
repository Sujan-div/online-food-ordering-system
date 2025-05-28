# Use SDK image even at runtime (not ideal for production)
FROM mcr.microsoft.com/dotnet/sdk:7.0

WORKDIR /app

COPY . ./

# Install EF tools
RUN dotnet tool install --global dotnet-ef --version 7.0.14
ENV PATH="$PATH:/root/.dotnet/tools"

RUN dotnet restore
RUN dotnet publish -c Release -o out

WORKDIR /app/out

ENTRYPOINT ["dotnet", "OrderService.dll"]
