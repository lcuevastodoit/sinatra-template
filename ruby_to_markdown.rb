require 'fileutils'

# Función para obtener todos los archivos Ruby recursivamente
def obtener_archivos_ruby(directorio)
  Dir.glob("#{directorio}/**/*.rb")
end

# Función para leer el contenido de un archivo
def leer_archivo(ruta)
  File.read(ruta)
rescue StandardError => e
  "Error al leer el archivo: #{e.message}"
end

# Función para escribir en el archivo markdown
def escribir_en_markdown(archivos, archivo_markdown)
  File.open(archivo_markdown, 'w') do |f|
    archivos.each do |archivo|
      contenido = leer_archivo(archivo)
      f.puts "# #{archivo}\n\n```ruby\n#{contenido}\n```\n\n"
    end

    # Incluir el contenido del Gemfile si existe
    gemfile_path = File.join(Dir.pwd, 'Gemfile')
    if File.exist?(gemfile_path)
      gemfile_contenido = leer_archivo(gemfile_path)
      f.puts "# Gemfile\n\n```ruby\n#{gemfile_contenido}\n```\n\n"
    end
  end
end

# Directorio del proyecto y archivo markdown de salida
directorio_proyecto = ARGV[0] || '.'
archivo_markdown_salida = ARGV[1] || 'proyecto_codigo.md'

# Obtener todos los archivos Ruby
archivos_ruby = obtener_archivos_ruby(directorio_proyecto)

# Escribir las rutas y el contenido de los archivos en el markdown
escribir_en_markdown(archivos_ruby, archivo_markdown_salida)

puts "Archivo Markdown generado exitosamente: #{archivo_markdown_salida}"
