param(
    [switch]$setup = $false,
    [switch]$unlock = $false,
    [switch]$backup = $false,
    [switch]$cleanup = $false
)

if ($setup) {
    # make venv
    Set-Location kyocera-ky-42c-unlock
    python -m venv venv
    ./venv/Scripts/activate
    pip install -r requirements.txt
    # patch with momo's utils.py
    Move-Item ./lib/utils.py ./lib/utils.old
    Copy-Item ../momo-utils-py/utils.py ./lib/utils.py
    Set-Location ..
    # download penumbra/antumbra, comment these lines if you'd like to manually download these files.
    Invoke-WebRequest https://github.com/shomykohai/penumbra/releases/download/v1.1.0/antumbra.exe -OutFile ./antumbra.exe
    # download MTK DA from mtkclient repo
    Invoke-WebRequest https://github.com/bkerler/mtkclient/raw/refs/heads/main/mtkclient/Loader/MTK_DA_V5.bin -OutFile ./MTK_DA_V5.bin
}

if ($unlock) {
    Write-Output "Power off your phone and plug it in. It should reboot with an 'Orange State' message."
    python kyocera-ky-42c-unlock/main.py unlock
}

if ($backup) {
    New-Item "./backup" -Type Directory
    python kyocera-ky-42c-unlock/main.py patch
    ./antumbra.exe rl backup --skip userdata --da ./MTK_DA_V5.bin
}

if ($cleanup) {
    # undo filesystem changes, except for the backup
    # for debugging purposes
    Remove-Item ./antumbra.exe
    Remove-Item ./MTK_DA_V5.bin
    Remove-Item kyocera-ky-42c-unlock/lib/utils.py
    Move-Item kyocera-ky-42c-unlock/lib/utils.old kyocera-ky-42c-unlock/lib/utils.py
}
