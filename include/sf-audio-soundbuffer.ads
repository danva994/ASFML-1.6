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

with Sf.Config;
with Sf.Audio.Types;
with Sf.System.InputStream;

package Sf.Audio.SoundBuffer is
   use Sf.Config;
   use Sf.Audio.Types;

   -- ////////////////////////////////////////////////////////////
   -- /// Create a new sound buffer and load it from a file
   -- ///
   -- /// \param Filename : Path of the music file to open
   -- ///
   -- /// \return A new sfSoundBuffer object (NULL if failed)
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSoundBuffer_CreateFromFile (Filename : String) return sfSoundBuffer_Ptr;

   -- ////////////////////////////////////////////////////////////
   -- /// Create a new sound buffer and load it from a file in memory
   -- ///
   -- /// \param Data :        Pointer to the file data in memory
   -- /// \param SizeInBytes : Size of the data to load, in bytes
   -- ///
   -- /// \return A new sfSoundBuffer object (NULL if failed)
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSoundBuffer_CreateFromMemory (Data : sfInt8_Ptr; SizeInBytes : sfSize_t) return sfSoundBuffer_Ptr;


  --//////////////////////////////////////////////////////////
  --/ \brief Create a new sound buffer and load it from a custom stream
  --/
  --/ Here is a complete list of all the supported audio formats:
  --/ ogg, wav, flac, aiff, au, raw, paf, svx, nist, voc, ircam,
  --/ w64, mat4, mat5 pvf, htk, sds, avr, sd2, caf, wve, mpc2k, rf64.
  --/
  --/ \param stream Source stream to read from
  --/
  --/ \return A new sfSoundBuffer object (NULL if failed)
  --/
  --//////////////////////////////////////////////////////////
   function sfSoundBuffer_createFromStream
     (stream : access Sf.System.InputStream.sfInputStream) return sfSoundBuffer_Ptr;

   -- ////////////////////////////////////////////////////////////
   -- /// Create a new sound buffer and load it from an array of
   -- /// samples in memory - assumed format for samples is
   -- /// 16 bits signed integer
   -- ///
   -- /// \param Samples :       Pointer to the samples in memory
   -- /// \param SamplesCount :  Number of samples pointed by Samples
   -- /// \param ChannelsCount : Number of channels (1 = mono, 2 = stereo, ...)
   -- /// \param SampleRate :    Frequency (number of samples to play per second)
   -- ///
   -- /// \return A new sfSoundBuffer object (NULL if failed)
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSoundBuffer_CreateFromSamples
     (Samples       : sfInt16_Ptr;
      SamplesCount  : sfSize_t;
      ChannelsCount : sfUint32;
      SampleRate    : sfUint32)
      return          sfSoundBuffer_Ptr;

   --//////////////////////////////////////////////////////////
   --/ \brief Create a new sound buffer by copying an existing one
   --/
   --/ \param soundBuffer Sound buffer to copy
   --/
   --/ \return A new sfSoundBuffer object which is a copy of \a soundBuffer
   --/
   --//////////////////////////////////////////////////////////
   function sfSoundBuffer_copy (soundBuffer : sfSoundBuffer_Ptr) return sfSoundBuffer_Ptr;

   -- ////////////////////////////////////////////////////////////
   -- /// Destroy an existing sound buffer
   -- ///
   -- /// \param SoundBuffer : Sound buffer to delete
   -- ///
   -- ////////////////////////////////////////////////////////////
   procedure sfSoundBuffer_Destroy (SoundBuffer : sfSoundBuffer_Ptr);

   -- ////////////////////////////////////////////////////////////
   -- /// Save a sound buffer to a file
   -- ///
   -- /// \param SoundBuffer : Sound buffer to save
   -- /// \param Filename :    Path of the sound file to write
   -- ///
   -- /// \return sfTrue if saving has been successful
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSoundBuffer_SaveToFile (SoundBuffer : sfSoundBuffer_Ptr; Filename : String) return sfBool;

   -- ////////////////////////////////////////////////////////////
   -- /// Return the samples contained in a sound buffer
   -- ///
   -- /// \param SoundBuffer : Sound buffer to get samples from
   -- ///
   -- /// \return Pointer to the array of sound samples, in 16 bits signed integer format
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSoundBuffer_GetSamples (SoundBuffer : sfSoundBuffer_Ptr) return sfInt16_Ptr;

   -- ////////////////////////////////////////////////////////////
   -- /// Return the number of samples contained in a sound buffer
   -- ///
   -- /// \param SoundBuffer : Sound buffer to get samples count from
   -- ///
   -- /// \return Number of samples
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSoundBuffer_GetSampleCount (SoundBuffer : sfSoundBuffer_Ptr) return sfSize_t;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the sample rate of a sound buffer
   -- ///
   -- /// \param SoundBuffer : Sound buffer to get sample rate from
   -- ///
   -- /// \return Sound frequency (number of samples per second)
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSoundBuffer_GetSampleRate (SoundBuffer : sfSoundBuffer_Ptr) return sfUint32;

   -- ////////////////////////////////////////////////////////////
   -- /// Return the number of channels of a sound buffer (1 = mono, 2 = stereo, ...)
   -- ///
   -- /// \param SoundBuffer : Sound buffer to get channels count from
   -- ///
   -- /// \return Number of channels
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSoundBuffer_GetChannelCount (SoundBuffer : sfSoundBuffer_Ptr) return sfUint32;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the duration of a sound buffer
   -- ///
   -- /// \param SoundBuffer : Sound buffer to get duration from
   -- ///
   -- /// \return Sound duration, in seconds
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfSoundBuffer_GetDuration (SoundBuffer : sfSoundBuffer_Ptr) return Float;

private

   pragma Import (C, sfSoundBuffer_createFromMemory, "sfSoundBuffer_createFromMemory");
   pragma Import (C, sfSoundBuffer_createFromStream, "sfSoundBuffer_createFromStream");
   pragma Import (C, sfSoundBuffer_createFromSamples, "sfSoundBuffer_createFromSamples");
   pragma Import (C, sfSoundBuffer_copy, "sfSoundBuffer_copy");
   pragma Import (C, sfSoundBuffer_destroy, "sfSoundBuffer_destroy");
   pragma Import (C, sfSoundBuffer_getSamples, "sfSoundBuffer_getSamples");
   pragma Import (C, sfSoundBuffer_getSampleCount, "sfSoundBuffer_getSampleCount");
   pragma Import (C, sfSoundBuffer_getSampleRate, "sfSoundBuffer_getSampleRate");
   pragma Import (C, sfSoundBuffer_getChannelCount, "sfSoundBuffer_getChannelCount");
   pragma Import (C, sfSoundBuffer_getDuration, "sfSoundBuffer_getDuration");

end Sf.Audio.SoundBuffer;
