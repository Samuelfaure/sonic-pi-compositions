use_bpm 115

use_random_seed 0

set :part1_off, false
set :part2_off, false

# Definitions
def progression
  [1, 5, 6, 4]
end

def melody_loop
  with_fx :ping_pong, mix: 0.5, phase: 0.5 do
    progression.each do |d|
      use_synth :blade
      play (chord_degree d, :d, :minor_pentatonic, 4).choose, amp: 1, release: 1.5 unless get[:part1_off]
      sleep [0.5, 0.5, 0.5, 1].choose
    end
  end
end

def chordy_loop
  progression.each do |d|
    play_chord (chord_degree d, :d, :minor, 3), amp: 1.2, release: 1.5 unless get[:part1_off]
    sleep 2
  end
end

# Part 1
live_loop :chordy do
  use_synth :bass_foundation
  3.times do
    with_fx :ping_pong, mix: 0.5, phase: 0.5 do
      chordy_loop
    end
  end
  sleep 6
end

live_loop :melody1 do
  4.times do
    melody_loop
  end

  3.times do
    with_fx :slicer, phase: 0.5 do
      melody_loop
    end
  end
end

# Part 2
sleep 9

use_synth :sine

live_loop :melody2, amp: 3 do
  with_fx :hpf, cutoff: 90, cutoff_slide: 2, cutoff_slide_shape: 3 do
    notes = (scale :Eb3, :minor_pentatonic).shuffle
    play notes unless get[:part2_off]
    sleep [0.5, 0.5, 0.5, 1].choose
  end
end

live_loop :drum_extra do
  sample :drum_cymbal_closed, rate: [-1, 1, 1, 1].choose, amp: 2 unless get[:part2_off]
  sleep 4
end

live_loop :drums do
  sample :drum_bass_hard, amp: 1.5 unless get[:part2_off]
  sleep 1
end

live_loop :ding do
  sync :drums
  sample :drum_cymbal_soft, beat_stretch: 2, amp: 1.3 unless get[:part2_off]
  sleep 2
end

live_loop :dingding do
  sync :drums
  sleep 1
  sample :drum_cymbal_closed, amp: 1.3 unless get[:part2_off]
  sleep 1
end

sleep 21

live_loop :bassy_test do
  2.times do
    use_synth :supersaw
    progression.each do |d|
      play_chord (chord_degree d, :d4, :minor, 3), amp: 2, release: 3 unless get[:part2_off]
      sleep 2
    end
  end
  sleep 14
end
# Part 3 - Outro

sleep 46
set :part2_off, true
sleep 12
set :part1_off, true
