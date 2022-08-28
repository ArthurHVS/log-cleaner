### Customização :pencil:

Para customizar a pasta em que os logs (ou outros arquivos a serem periodicamente apagados) estão, edite a variável `LOG_FOLDER`

### Instalação :floppy_disk:

Esse script foi criado para ser diretamente copiado em um dos diretórios `/etc/cron.*`
Ele também pode ser instalado com o comando `crontab -e`, que edita as entradas do crontab.

### Limitações :bomb:

Esse script utiliza a biblioteca "Zenity", o que significa que o funcionamento dele só é possível em ambientes gráficos GNOME.

### Licensa :scroll:

Esse script está licensiado sob a GNU General Purpose License. Disponibilizamos uma cópia desse documento em `./gpl.txt`