
$inputPath = "d:\Workspace\MR\OUTPUT\Doc\the_last_lesson.md"
$outputPath = "d:\Workspace\MR\OUTPUT\Media\the_last_lesson.wav"

# Check if input file exists
if (-not (Test-Path $inputPath)) {
    Write-Error "Input file not found: $inputPath"
    exit 1
}

# Read the file content
$content = Get-Content -Path $inputPath -Raw -Encoding UTF8

# Basic Markdown cleanup for better reading
# Remove headers (#)
$content = $content -replace '(?m)^#+\s*', ''
# Remove bold/italic markers (*)
$content = $content -replace '\*', ''
# Remove links [text](url) -> text
$content = $content -replace '\[([^\]]+)\]\([^\)]+\)', '$1'
# Remove images ![alt](url) -> empty
$content = $content -replace '!\[[^\]]*\]\([^\)]+\)', ''
# Remove blockquotes (>)
$content = $content -replace '(?m)^>\s*', ''

Write-Host "Preparing to convert text to audio..."
Write-Host "Input: $inputPath"
Write-Host "Output: $outputPath"

# Initialize Speech Synthesizer
Add-Type -AssemblyName System.Speech
$synth = New-Object System.Speech.Synthesis.SpeechSynthesizer

# Select Voice (Microsoft Huihui Desktop - Female Chinese)
try {
    $synth.SelectVoice("Microsoft Huihui Desktop")
    Write-Host "Selected Voice: Microsoft Huihui Desktop"
}
catch {
    Write-Warning "Microsoft Huihui Desktop not found. Falling back to default voice."
}

# Configure output format to 16kHz Mono 16-bit (Speech Quality) to reduce file size
$format = New-Object System.Speech.AudioFormat.SpeechAudioFormatInfo(16000, [System.Speech.AudioFormat.AudioBitsPerSample]::Sixteen, [System.Speech.AudioFormat.AudioChannel]::Mono)
$synth.SetOutputToWaveFile($outputPath, $format)

# Speak the content
Write-Host "Generating audio... This may take a moment."
$synth.Speak($content)

# Clean up
$synth.SetOutputToNull()
$synth.Dispose()

Write-Host "Audio generation complete: $outputPath"

# Check for ffmpeg and convert to mp3
if (Get-Command "ffmpeg" -ErrorAction SilentlyContinue) {
    $mp3Path = $outputPath -replace '\.wav$', '.mp3'
    Write-Host "Converting to MP3: $mp3Path"
    
    # Use -y to overwrite without asking, -codec:a libmp3lame -qscale:a 4 for good quality VBR
    # -loglevel error to reduce noise
    $ffmpegArgs = @("-i", "$outputPath", "-codec:a", "libmp3lame", "-qscale:a", "4", "-y", "$mp3Path", "-loglevel", "error")
    
    $process = Start-Process -FilePath "ffmpeg" -ArgumentList $ffmpegArgs -Wait -NoNewWindow -PassThru
    
    if ($process.ExitCode -eq 0) {
        Write-Host "Conversion successful."
        Write-Host "Removing original WAV file to save space..."
        Remove-Item $outputPath
        Write-Host "Final output: $mp3Path"
    } else {
        Write-Error "FFmpeg conversion failed."
    }
} else {
    Write-Warning "FFmpeg not found. Skipping MP3 conversion."
}
