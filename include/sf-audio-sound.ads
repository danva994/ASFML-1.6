-- ////////////////////////////////////////////////////////////
-- //
-- // SFML - Simple and Fast Multimedia Library
-- // Copyright (C) 2007-2009 Laurent Gomila (laurent.gom@gmail.com)
-- //
-- // This software is provided 'as-is', without any express or implied warranty.
-- // In no event will the authors be held liable for any damages arising from the use of this software.
-- //
-- // Permission is granted to anyone to use this software for any purpose,
-- // including commercial applications, and to alter it and redistribute it freely,
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
-- // 3. This notice may not be removed or altered from any source distribution.
-- //
-- ////////////////////////////////////////////////////////////

-- ////////////////////////////////////////////////////////////
-- // Headers
-- ////////////////////////////////////////////////////////////
with Sf.Config;
with Sf.Audio.SoundStatus;
with Sf.Audio.Types;

package Sf.Audio.Sound is
   use Sf.Config;
   use Sf.Audio.SoundStatus;
   use Sf.Audio.Types;

   -- ////////////////////////////////////////////////////////////
   -- /// Construct a new sound
   -- ///
   -- /// \return A new sfSound object (NULL if failed)
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSound_Create return sfSound_Ptr;

   -- ////////////////////////////////////////////////////////////
   -- /// Destroy an existing sound
   -- ///
   -- /// \param Sound : Sound to delete
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfSound_Destroy (Sound : sfSound_Ptr);

   -- ////////////////////////////////////////////////////////////
   -- /// Start playing a sound
   -- ///
   -- /// \param Sound : Sound to play
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfSound_Play (Sound : sfSound_Ptr);

   -- ////////////////////////////////////////////////////////////
   -- /// Pause a sound
   -- ///
   -- /// \param Sound : Sound to pause
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfSound_Pause (Sound : sfSound_Ptr);

   -- ////////////////////////////////////////////////////////////
   -- /// Stop playing a sound
   -- ///
   -- /// \param Sound : Sound to stop
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfSound_Stop (Sound : sfSound_Ptr);

   -- ////////////////////////////////////////////////////////////
   -- /// Bind a sound buffer to a sound
   -- ///
   -- /// \param Sound :  Sound to set the loop state
   -- /// \param Buffer : Buffer to bind
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfSound_SetBuffer (Sound : sfSound_Ptr; Buffer : sfSoundBuffer_Ptr);

   -- ////////////////////////////////////////////////////////////
   -- /// Get the sound buffer bound to a sound
   -- ///
   -- /// \param Sound : Sound to get the buffer from
   -- ///
   -- /// \return Pointer to the sound's buffer
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSound_GetBuffer (Sound : sfSound_Ptr) return sfSoundBuffer_Ptr;

   -- ////////////////////////////////////////////////////////////
   -- /// Set a sound loop state
   -- ///
   -- /// \param Sound : Sound to set the loop state
   -- /// \param Loop :  sfTrue to play in loop, sfFalse to play once
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfSound_SetLoop (Sound : sfSound_Ptr; Enable : sfBool);

   -- ////////////////////////////////////////////////////////////
   -- /// Tell whether or not a sound is looping
   -- ///
   -- /// \param Sound : Sound to get the loop state from
   -- ///
   -- /// \return sfTrue if the sound is looping, sfFalse otherwise
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSound_GetLoop (Sound : sfSound_Ptr) return sfBool;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the status of a sound (stopped, paused, playing)
   -- ///
   -- /// \param Sound : Sound to get the status from
   -- ///
   -- /// \return Current status of the sound
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSound_GetStatus (Sound : sfSound_Ptr) return sfSoundStatus;

   -- ////////////////////////////////////////////////////////////
   -- /// Set the pitch of a sound
   -- ///
   -- /// \param Sound : Sound to modify
   -- /// \param Pitch : New pitch
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfSound_SetPitch (Sound : sfSound_Ptr; Pitch : Float);

   -- ////////////////////////////////////////////////////////////
   -- /// Set the volume of a sound
   -- ///
   -- /// \param Sound :  Sound to modify
   -- /// \param Volume : Volume (in range [0, 100])
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfSound_SetVolume (Sound : sfSound_Ptr; Volume : Float);

   -- ////////////////////////////////////////////////////////////
   -- /// Set the position of a sound
   -- ///
   -- /// \param Sound : Sound to modify
   -- /// \param X : X   position of the sound in the world
   -- /// \param Y : Y   position of the sound in the world
   -- /// \param Z : Z   position of the sound in the world
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfSound_SetPosition (Sound : sfSound_Ptr; X, Y, Z : Float);

   -- ////////////////////////////////////////////////////////////
   -- /// Make the sound's position relative to the listener's
   -- /// position, or absolute.
   -- /// The default value is false (absolute)
   -- ///
   -- /// \param Sound :    Sound to modify
   -- /// \param Relative : True to set the position relative, false to set it absolute
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfSound_SetRelativeToListener (Sound : sfSound_Ptr; Relative : sfBool);

   -- ////////////////////////////////////////////////////////////
   -- /// Set the minimum distance - closer than this distance,
   -- /// the listener will hear the sound at its maximum volume.
   -- /// The default minimum distance is 1.0
   -- ///
   -- /// \param Sound :       Sound to modify
   -- /// \param MinDistance : New minimum distance for the sound
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfSound_SetMinDistance (Sound : sfSound_Ptr; MinDistance : Float);

   -- ////////////////////////////////////////////////////////////
   -- /// Set the attenuation factor - the higher the attenuation, the
   -- /// more the sound will be attenuated with distance from listener.
   -- /// The default attenuation factor is 1.0
   -- ///
   -- /// \param Sound :       Sound to modify
   -- /// \param Attenuation : New attenuation factor for the sound
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfSound_SetAttenuation (Sound : sfSound_Ptr; Attenuation : Float);

   -- ////////////////////////////////////////////////////////////
   -- /// Set the current playing position of a sound
   -- ///
   -- /// \param Sound :      Sound to modify
   -- /// \param TimeOffset : New playing position, expressed in seconds
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfSound_SetPlayingOffset (Sound : sfSound_Ptr; TimeOffset : Float);

   -- ////////////////////////////////////////////////////////////
   -- /// Get the pitch of a sound
   -- ///
   -- /// \param Sound : Sound to get the pitch from
   -- ///
   -- /// \return Pitch value
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSound_GetPitch (Sound : sfSound_Ptr) return Float;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the volume of a sound
   -- ///
   -- /// \param Sound : Sound to get the volume from
   -- ///
   -- /// \return Volume value (in range [1, 100])
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSound_GetVolume (Sound : sfSound_Ptr) return Float;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the position of a sound
   -- ///
   -- /// \param Sound : Sound to get the position from
   -- /// \param X :     X position of the sound in the world
   -- /// \param Y :     Y position of the sound in the world
   -- /// \param Z :     Z position of the sound in the world
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfSound_GetPosition (Sound : sfSound_Ptr; X, Y, Z : access Float);

   -- ////////////////////////////////////////////////////////////
   -- /// Tell if the sound's position is relative to the listener's
   -- /// position, or if it's absolute
   -- ///
   -- /// \param Sound : Sound to check
   -- ///
   -- /// \return sfTrue if the position is relative, sfFalse if it's absolute
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSound_IsRelativeToListener (Sound : sfSound_Ptr) return sfBool;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the minimum distance of a sound
   -- ///
   -- /// \param Sound : Sound to get the minimum distance from
   -- ///
   -- /// \return Minimum distance for the sound
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSound_GetMinDistance (Sound : sfSound_Ptr) return Float;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the attenuation factor of a sound
   -- ///
   -- /// \param Sound : Sound to get the attenuation factor from
   -- ///
   -- /// \return Attenuation factor for the sound
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSound_GetAttenuation (Sound : sfSound_Ptr) return Float;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the current playing position of a sound
   -- ///
   -- /// \param Sound : Sound to get the position from
   -- ///
   -- /// \return Current playing position, expressed in seconds
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSound_GetPlayingOffset (Sound : sfSound_Ptr) return Float;

private

   pragma Import (C, sfSound_Create, "sfSound_Create");
   pragma Import (C, sfSound_Destroy, "sfSound_Destroy");
   pragma Import (C, sfSound_Play, "sfSound_Play");
   pragma Import (C, sfSound_Pause, "sfSound_Pause");
   pragma Import (C, sfSound_Stop, "sfSound_Stop");
   pragma Import (C, sfSound_SetBuffer, "sfSound_SetBuffer");
   pragma Import (C, sfSound_GetBuffer, "sfSound_GetBuffer");
   pragma Import (C, sfSound_SetLoop, "sfSound_SetLoop");
   pragma Import (C, sfSound_GetLoop, "sfSound_GetLoop");
   pragma Import (C, sfSound_GetStatus, "sfSound_GetStatus");
   pragma Import (C, sfSound_SetPitch, "sfSound_SetPitch");
   pragma Import (C, sfSound_SetVolume, "sfSound_SetVolume");
   pragma Import (C, sfSound_SetPosition, "sfSound_SetPosition");
   pragma Import (C, sfSound_SetRelativeToListener, "sfSound_SetRelativeToListener");
   pragma Import (C, sfSound_SetMinDistance, "sfSound_SetMinDistance");
   pragma Import (C, sfSound_SetAttenuation, "sfSound_SetAttenuation");
   pragma Import (C, sfSound_SetPlayingOffset, "sfSound_SetPlayingOffset");
   pragma Import (C, sfSound_GetPitch, "sfSound_GetPitch");
   pragma Import (C, sfSound_GetVolume, "sfSound_GetVolume");
   pragma Import (C, sfSound_GetPosition, "sfSound_GetPosition");
   pragma Import (C, sfSound_IsRelativeToListener, "sfSound_IsRelativeToListener");
   pragma Import (C, sfSound_GetMinDistance, "sfSound_GetMinDistance");
   pragma Import (C, sfSound_GetAttenuation, "sfSound_GetAttenuation");
   pragma Import (C, sfSound_GetPlayingOffset, "sfSound_GetPlayingOffset");

end Sf.Audio.Sound;
