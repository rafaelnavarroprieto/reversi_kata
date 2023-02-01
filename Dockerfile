# Establecer una imagen base
FROM ruby:2.7

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar el archivo Gemfile y Gemfile.lock al contenedor
COPY Gemfile Gemfile.lock ./

# Instalar las dependencias de Ruby
RUN bundle install

# Copiar el resto del proyecto al contenedor
COPY . .

# Ejecutar el comando rspec
CMD ["bundle", "exec", "rspec"]