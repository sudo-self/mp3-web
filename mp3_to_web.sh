#!/bin/bash

# Output HTML file name
output_file="index.html"

# Start the HTML file
cat <<EOF > "$output_file"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MP3 Playlist</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #121212;
      color: #ffffff;
      text-align: center;
    }
    .audio-player {
      margin: 20px 0;
    }
    ul {
      list-style: none;
      padding: 0;
    }
    li {
      margin: 10px 0;
      cursor: pointer;
      color: #00d8ff;
    }
    li:hover {
      text-decoration: underline;
    }
    footer {
      margin-top: 20px;
      font-size: 0.9em;
      color: #888888;
    }
  </style>
</head>
<body>
  <h1>MP3 Web</h1>
  <div class="audio-player">
    <audio id="main-audio-player" controls>
      <source src="" type="audio/mpeg">
      Your browser does not support the audio element.
    </audio>
  </div>
  <ul id="playlist">
EOF

# Loop through all .mp3 files in the current directory
for file in *.mp3; do
  # Check if any .mp3 files exist
  if [[ -f "$file" ]]; then
    echo "    <li data-src=\"$file\">$file</li>" >> "$output_file"
  fi
done

# End the HTML file with JavaScript for interactivity and footer
cat <<EOF >> "$output_file"
  </ul>
  <script>
    // Get the audio player and playlist
    const audioPlayer = document.getElementById('main-audio-player');
    const playlist = document.getElementById('playlist');

    // Add click event listeners to all playlist items
    playlist.addEventListener('click', function(event) {
      if (event.target && event.target.tagName === 'LI') {
        const songSrc = event.target.getAttribute('data-src');
        audioPlayer.querySelector('source').src = songSrc;
        audioPlayer.load(); // Reload the audio player with the new source
        audioPlayer.play(); // Play the selected song
      }
    });
  </script>
  <footer>
  <a href="#" style="color: #00d8ff; text-decoration: none;">@sudo-self</a>
  </footer>
</body>
</html>
EOF

echo "HTML file '$output_file' created successfully."

