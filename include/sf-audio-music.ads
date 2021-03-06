-- ////////////////////////////////////////////////////////////
-- //
-- // SFML - Simple and Fast Multimedia Library
-- // Copyright (C) 2007-2009 Laurent Gomila (laurent.gom@gmail.com)
-- //
-- // This software is provided 'as-is', without any express or implied
-- // warranty.
-- // In no event will the authors be held liable for any damages arising from
-- // the use of this software.
-- //
-- // Permission is granted to anyone to use this software for any purpose,
-- // including commercial applications, and to alter it and redistribute it
-- // freely,
-- // subject to the following restrictions:
-- //
-- // 1. The origin of this software must not be misrepresented;
-- //    you must not claim that you wrote the original software.
-- //    If you use this software in a product, an acknowledgment
-- //    in the product documentation would be appreciated but is not required.
-- //
-- // 2. Altered source versions must be plainly marked as such,
-- //    and must not be misrepresented as being the original software.
-- //
-- // 3. This notice may not be removed or altered from any source
-- //    distribution.
-- //
-- ////////////////////////////////////////////////////////////

-- ////////////////////////////////////////////////////////////
-- // Headers
-- ////////////////////////////////////////////////////////////
with Sf.Config;
with Sf.Audio.SoundStatus;
with Sf.Audio.Types;

package Sf.Audio.Music is
   use Sf.Config;
   use Sf.Audio.SoundStatus;
   use Sf.Audio.Types;

   -- ////////////////////////////////////////////////////////////
   -- /// Create a new music and load it from a file
   -- ///
   -- /// \param Filename : Path of the music file to open
   -- ///
   -- /// \return A new sfMusic object (NULL if failed)
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfMusic_CreateFromFile (Filename : String) return sfMusic_Ptr;

   -- ////////////////////////////////////////////////////////////
   -- /// Create a new music and load it from a file in memory
   -- ///
   -- /// \param Data :        Pointer to the file data in memory
   -- /// \param SizeInBytes : Size of the data to load, in bytes
   -- ///
   -- /// \return A new sfMusic object (NULL if failed)
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfMusic_CreateFromMemory (Data : sfInt8_Ptr; SizeInBytes : sfSize_t) return sfMusic_Ptr;

   -- ////////////////////////////////////////////////////////////
   -- /// Destroy an existing music
   -- ///
   -- /// \param Music : Music to delete
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfMusic_Destroy (Music : sfMusic_Ptr);

   -- ////////////////////////////////////////////////////////////
   -- /// Set a music loop state
   -- ///
   -- /// \param Music : Music to set the loop state
   -- /// \param Loop :  sfTrue to play in loop, sfFalse to play once
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfMusic_SetLoop (Music : sfMusic_Ptr; Enable : sfBool);

   -- ////////////////////////////////////////////////////////////
   -- /// Tell whether or not a music is looping
   -- ///
   -- /// \param Music : Music to get the loop state from
   -- ///
   -- /// \return sfTrue if the music is looping, sfFalse otherwise
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfMusic_GetLoop (Music : sfMusic_Ptr) return sfBool;

   -- ////////////////////////////////////////////////////////////
   -- /// Get a music duration
   -- ///
   -- /// \param Music : Music to get the duration from
   -- ///
   -- /// \return Music duration, in seconds
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfMusic_GetDuration (Music : sfMusic_Ptr) return Float;

   -- ////////////////////////////////////////////////////////////
   -- /// Start playing a music
   -- ///
   -- /// \param Music : Music to play
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfMusic_Play (Music : sfMusic_Ptr);

   -- ////////////////////////////////////////////////////////////
   -- /// Pause a music
   -- ///
   -- /// \param Music : Music to pause
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfMusic_Pause (Music : sfMusic_Ptr);

   -- ////////////////////////////////////////////////////////////
   -- /// Stop playing a music
   -- ///
   -- /// \param Music : Music to stop
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfMusic_Stop (Music : sfMusic_Ptr);

   -- ////////////////////////////////////////////////////////////
   -- /// Return the number of channels of a music (1 = mono, 2 = stereo)
   -- ///
   -- /// \param Music : Music to get the channels count from
   -- ///
   -- /// \return Number of channels
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfMusic_GetChannelsCount (Music : sfMusic_Ptr) return sfUint32;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the stream sample rate of a music
   -- ///
   -- /// \param Music : Music to get the sample rate from
   -- ///
   -- /// \return Stream frequency (number of samples per second)
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfMusic_GetSampleRate (Music : sfMusic_Ptr) return sfUint32;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the status of a music (stopped, paused, playing)
   -- ///
   -- /// \param Music : Music to get the status from
   -- ///
   -- /// \return Current status of the sound
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfMusic_GetStatus (Music : sfMusic_Ptr) return sfSoundStatus;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the current playing position of a music
   -- ///
   -- /// \param Music : Music to get the position from
   -- ///
   -- /// \return Current playing position, expressed in seconds
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfMusic_GetPlayingOffset (Music : sfMusic_Ptr) return Float;

   -- ////////////////////////////////////////////////////////////
   -- /// Set the pitch of a music
   -- ///
   -- /// \param Music : Music to modify
   -- /// \param Pitch : New pitch
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfMusic_SetPitch (Music : sfMusic_Ptr; Pitch : Float);

   -- ////////////////////////////////////////////////////////////
   -- /// Set the volume of a music
   -- ///
   -- /// \param Music :  Music to modify
   -- /// \param Volume : Volume (in range [0, 100])
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfMusic_SetVolume (Music : sfMusic_Ptr; Volume : Float);

   -- ////////////////////////////////////////////////////////////
   -- /// Set the position of a music
   -- ///
   -- /// \param Music : Music to modify
   -- /// \param X : X   position of the sound in the world
   -- /// \param Y : Y   position of the sound in the world
   -- /// \param Z : Z   position of the sound in the world
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfMusic_SetPosition (Music : sfMusic_Ptr; X, Y, Z : Float);

   -- ////////////////////////////////////////////////////////////
   -- /// Make the music's position relative to the listener's
   -- /// position, or absolute.
   -- /// The default value is false (absolute)
   -- ///
   -- /// \param Music :    Music to modify
   -- /// \param Relative : True to set the position relative, false to set it absolute
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfMusic_SetRelativeToListener (Music : sfMusic_Ptr; Relative : sfBool);

   -- ////////////////////////////////////////////////////////////
   -- /// Set the minimum distance - closer than this distance,
   -- /// the listener will hear the music at its maximum volume.
   -- /// The default minimum distance is 1.0
   -- ///
   -- /// \param Music :       Music to modify
   -- /// \param MinDistance : New minimum distance for the music
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfMusic_SetMinDistance (Music : sfMusic_Ptr; MinDistance : Float);

   -- ////////////////////////////////////////////////////////////
   -- /// Set the attenuation factor - the higher the attenuation, the
   -- /// more the sound will be attenuated with distance from listener.
   -- /// The default attenuation factor 1.0
   -- ///
   -- /// \param Sound :       Sound to modify
   -- /// \param Attenuation : New attenuation factor for the sound
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfMusic_SetAttenuation (Music : sfMusic_Ptr; Attenuation : Float);

   -- ////////////////////////////////////////////////////////////
   -- /// Get the pitch of a music
   -- ///
   -- /// \param Music : Music to get the pitch from
   -- ///
   -- /// \return Pitch value
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfMusic_GetPitch (Music : sfMusic_Ptr) return Float;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the volume of a music
   -- ///
   -- /// \param Music : Music to get the volume from
   -- ///
   -- /// \return Volume value (in range [1, 100])
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfMusic_GetVolume (Music : sfMusic_Ptr) return Float;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the position of a music
   -- ///
   -- /// \param Music : Music to get the position from
   -- /// \param X :     X position of the sound in the world
   -- /// \param Y :     Y position of the sound in the world
   -- /// \param Z :     Z position of the sound in the world
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfMusic_GetPosition (Music : sfMusic_Ptr; X, Y, Z : access Float);

   -- ////////////////////////////////////////////////////////////
   -- /// Tell if the music's position is relative to the listener's
   -- /// position, or if it's absolute
   -- ///
   -- /// \param Music : Music to check
   -- ///
   -- /// \return sfTrue if the position is relative, sfFalse if it's absolute
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfMusic_IsRelativeToListener (Music : sfMusic_Ptr) return sfBool;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the minimum distance of a music
   -- ///
   -- /// \param Music : Music to get the minimum distance from
   -- ///
   -- /// \return Minimum distance for the music
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfMusic_GetMinDistance (Music : sfMusic_Ptr) return Float;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the attenuation factor of a music
   -- ///
   -- /// \param Music : Music to get the attenuation factor from
   -- ///
   -- /// \return Attenuation factor for the a music
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfMusic_GetAttenuation (Music : sfMusic_Ptr) return Float;

private

   pragma Import (C, sfMusic_CreateFromMemory, "sfMusic_CreateFromMemory");
   pragma Import (C, sfMusic_Destroy, "sfMusic_Destroy");
   pragma Import (C, sfMusic_SetLoop, "sfMusic_SetLoop");
   pragma Import (C, sfMusic_GetLoop, "sfMusic_GetLoop");
   pragma Import (C, sfMusic_GetDuration, "sfMusic_GetDuration");
   pragma Import (C, sfMusic_Play, "sfMusic_Play");
   pragma Import (C, sfMusic_Pause, "sfMusic_Pause");
   pragma Import (C, sfMusic_Stop, "sfMusic_Stop");
   pragma Import (C, sfMusic_GetChannelsCount, "sfMusic_GetChannelsCount");
   pragma Import (C, sfMusic_GetSampleRate, "sfMusic_GetSampleRate");
   pragma Import (C, sfMusic_GetStatus, "sfMusic_GetStatus");
   pragma Import (C, sfMusic_GetPlayingOffset, "sfMusic_GetPlayingOffset");
   pragma Import (C, sfMusic_SetPitch, "sfMusic_SetPitch");
   pragma Import (C, sfMusic_SetVolume, "sfMusic_SetVolume");
   pragma Import (C, sfMusic_SetPosition, "sfMusic_SetPosition");
   pragma Import (C, sfMusic_SetRelativeToListener, "sfMusic_SetRelativeToListener");
   pragma Import (C, sfMusic_SetMinDistance, "sfMusic_SetMinDistance");
   pragma Import (C, sfMusic_SetAttenuation, "sfMusic_SetAttenuation");
   pragma Import (C, sfMusic_GetPitch, "sfMusic_GetPitch");
   pragma Import (C, sfMusic_GetVolume, "sfMusic_GetVolume");
   pragma Import (C, sfMusic_GetPosition, "sfMusic_GetPosition");
   pragma Import (C, sfMusic_IsRelativeToListener, "sfMusic_IsRelativeToListener");
   pragma Import (C, sfMusic_GetMinDistance, "sfMusic_GetMinDistance");
   pragma Import (C, sfMusic_GetAttenuation, "sfMusic_GetAttenuation");

end Sf.Audio.Music;
