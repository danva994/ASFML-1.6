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
with Sf.Audio.Types;

package Sf.Audio.SoundBufferRecorder is
   use Sf.Config;
   use Sf.Audio.Types;

   -- ////////////////////////////////////////////////////////////
   -- /// Construct a new sound buffer recorder
   -- ///
   -- /// \return A new sfSoundBufferRecorder object (NULL if failed)
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSoundBufferRecorder_Create return sfSoundBufferRecorder_Ptr;

   -- ////////////////////////////////////////////////////////////
   -- /// Destroy an existing sound buffer recorder
   -- ///
   -- /// \param SoundBufferRecorder : Sound buffer recorder to delete
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfSoundBufferRecorder_Destroy (SoundBufferRecorder : sfSoundBufferRecorder_Ptr);

   -- ////////////////////////////////////////////////////////////
   -- /// Start the capture.
   -- /// Warning : only one capture can happen at the same time
   -- ///
   -- /// \param SoundBufferRecorder : Sound bufferrecorder to start
   -- /// \param SampleRate :          Sound frequency (the more samples, the higher the quality)
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfSoundBufferRecorder_Start (SoundBufferRecorder : sfSoundBufferRecorder_Ptr; SampleRate : sfUint32);

   -- ////////////////////////////////////////////////////////////
   -- /// Stop the capture
   -- ///
   -- /// \param SoundBufferRecorder : Sound buffer recorder to stop
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfSoundBufferRecorder_Stop (SoundBufferRecorder : sfSoundBufferRecorder_Ptr);

   -- ////////////////////////////////////////////////////////////
   -- /// Get the sample rate of a sound buffer recorder
   -- ///
   -- /// \param SoundBufferRecorder : Sound buffer recorder to get sample rate from
   -- ///
   -- /// \return Frequency, in samples per second
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSoundBufferRecorder_GetSampleRate (SoundBufferRecorder : sfSoundBufferRecorder_Ptr) return sfUint32;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the sound buffer containing the captured audio data
   -- /// of a sound buffer recorder
   -- ///
   -- /// \param SoundBufferRecorder : Sound buffer recorder to get the sound buffer from
   -- ///
   -- /// \return Pointer to the sound buffer (you don't need to destroy it after use)
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSoundBufferRecorder_GetBuffer (SoundBufferRecorder : sfSoundBufferRecorder_Ptr) return sfSoundBuffer_Ptr;

private

   pragma Import (C, sfSoundBufferRecorder_Create, "sfSoundBufferRecorder_Create");
   pragma Import (C, sfSoundBufferRecorder_Destroy, "sfSoundBufferRecorder_Destroy");
   pragma Import (C, sfSoundBufferRecorder_Start, "sfSoundBufferRecorder_Start");
   pragma Import (C, sfSoundBufferRecorder_Stop, "sfSoundBufferRecorder_Stop");
   pragma Import (C, sfSoundBufferRecorder_GetSampleRate, "sfSoundBufferRecorder_GetSampleRate");
   pragma Import (C, sfSoundBufferRecorder_GetBuffer, "sfSoundBufferRecorder_GetBuffer");

end Sf.Audio.SoundBufferRecorder;
