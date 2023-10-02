@echo off
chcp 65001
echo Установка Git и распаковка Java...

:: Установка Git (если Git не установлен)
if not exist "%ProgramFiles%\Git\bin\git.exe" (
    choco install git -y
)

:: Распаковка архива Java с использованием jar
if not exist java (
    mkdir java
    cd java
    jar xf ..\java.zip
    cd ..
)

:: Создание файла run.bat с командой для запуска Minecraft
echo java -jar minecraft.jar -Xmx2G -Xms1G -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalMode -XX:-UseAdaptiveSizePolicy -Xmn128M -Dfml.ignoreInvalidMinecraftCertificates=true -Dfml.ignorePatchDiscrepancies=true -XX:HeapDumpPath=MojangTricksIntelDriversForPerformance_javaw.exe_minecraft.exe.heapdump -Djava.library.path=natives -Dminecraft.launcher.brand=minecraft-launcher -Dminecraft.launcher.version=2.0.1381 -cp Minecraft.jar net.minecraft.client.main.Main > run.bat

echo Готово! Git установлен (если не был установлен), Java распакована, и создан run.bat для запуска Minecraft.
pause
