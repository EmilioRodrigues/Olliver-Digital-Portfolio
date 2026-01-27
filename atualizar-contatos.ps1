# Script de Atualização de Informações de Contato
# Olliver Digital Portfolio

# Informações antigas (exemplo)
$oldEmail = "contato@olliverdigital.com.br"
$oldPhone = "(85) 99999-9999"
$oldWhatsApp = "5585999999999"
$oldAddress = "Fortaleza, Ceará"
$oldURL = "https://www.olliverdigital.com.br/"
$oldInstagram = "https://www.instagram.com/olliverdigital"
$oldLatitude = "-3.7172"
$oldLongitude = "-38.5433"

# Informações novas (reais)
$newEmail = "ollivergraficadigital@gmail.com"
$newPhone = "(85) 98618-7858"
$newWhatsApp = "5585986187858"
$newAddress = "Tv. 15 de Novembro, 10 - Padre Romualdo, Caucaia - CE, 61601-340"
$newAddressShort = "Caucaia, Ceará"
$newURL = "https://olliverdigital.com.br/"
$newInstagram = "https://www.instagram.com/olliverdigital_marketingnaweb"
$newLatitude = "-3.7358"  # Coordenadas aproximadas de Caucaia
$newLongitude = "-38.6531"

# Lista de arquivos para atualizar
$files = @(
    "index.html",
    "blog.html",
    "artigo-1-como-aumentar-vendas-marketing-digital.html",
    "artigo-2-gestao-trafego-pago-resultados.html",
    "artigo-3-seo-local-pequenas-empresas.html",
    "artigo-4-redes-sociais-engajamento.html",
    "artigo-5-automacao-marketing-produtividade.html"
)

Write-Host "Iniciando atualização de informações de contato..." -ForegroundColor Green
Write-Host ""

foreach ($file in $files) {
    if (Test-Path $file) {
        Write-Host "Atualizando: $file" -ForegroundColor Yellow
        
        $content = Get-Content $file -Raw -Encoding UTF8
        
        # Substituições
        $content = $content -replace [regex]::Escape($oldEmail), $newEmail
        $content = $content -replace [regex]::Escape($oldPhone), $newPhone
        $content = $content -replace [regex]::Escape($oldWhatsApp), $newWhatsApp
        $content = $content -replace [regex]::Escape($oldInstagram), $newInstagram
        $content = $content -replace "Fortaleza, Ceará - Brasil", $newAddress
        $content = $content -replace "Fortaleza, Ceará", $newAddressShort
        $content = $content -replace [regex]::Escape($oldURL), $newURL
        $content = $content -replace [regex]::Escape($oldLatitude), $newLatitude
        $content = $content -replace [regex]::Escape($oldLongitude), $newLongitude
        
        # Salvar arquivo
        $content | Set-Content $file -Encoding UTF8 -NoNewline
        
        Write-Host "  ✓ Concluído" -ForegroundColor Green
    } else {
        Write-Host "  ✗ Arquivo não encontrado: $file" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Atualização concluída!" -ForegroundColor Green
Write-Host ""
Write-Host "Informações atualizadas:" -ForegroundColor Cyan
Write-Host "  Email: $newEmail"
Write-Host "  WhatsApp: $newPhone"
Write-Host "  Endereço: $newAddress"
Write-Host "  URL: $newURL"
Write-Host "  Instagram: $newInstagram"
