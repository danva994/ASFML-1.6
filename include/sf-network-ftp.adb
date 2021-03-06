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
with Interfaces.C.Strings;

package body Sf.Network.Ftp is
   use Interfaces.C.Strings;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the full message contained in the response
   -- ///
   -- /// \param FtpListingResponse : Ftp listing response
   -- ///
   -- /// \return The response message
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfFtpListingResponse_GetMessage (FtpListingResponse : sfFtpListingResponse_Ptr) return String is
      function Internal (FtpListingResponse : sfFtpListingResponse_Ptr) return chars_ptr;
      pragma Import (C, Internal, "sfFtpListingResponse_GetMessage");
      Temp : chars_ptr := Internal (FtpListingResponse);
      R    : String    := Value (Temp);
   begin
      Free (Temp);
      return R;
   end sfFtpListingResponse_GetMessage;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the Index-th filename in the directory
   -- ///
   -- /// \param FtpListingResponse : Ftp listing response
   -- /// \param Index :              Index of the filename to get
   -- ///
   -- /// \return Index-th filename
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfFtpListingResponse_GetFilename (FtpListingResponse : sfFtpListingResponse_Ptr; Index : sfSize_t) return String is
      function Internal (FtpListingResponse : sfFtpListingResponse_Ptr; Index : sfSize_t) return chars_ptr;
      pragma Import (C, Internal, "sfFtpListingResponse_GetFilename");
      Temp : chars_ptr := Internal (FtpListingResponse, Index);
      R    : String    := Value (Temp);
   begin
      Free (Temp);
      return R;
   end sfFtpListingResponse_GetFilename;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the full message contained in the response
   -- ///
   -- /// \param FtpDirectoryResponse : Ftp directory response
   -- ///
   -- /// \return The response message
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfFtpDirectoryResponse_GetMessage (FtpDirectoryResponse : sfFtpDirectoryResponse_Ptr) return String is
      function Internal (FtpDirectoryResponse : sfFtpDirectoryResponse_Ptr) return chars_ptr;
      pragma Import (C, Internal, "sfFtpDirectoryResponse_GetMessage");
      Temp : chars_ptr := Internal (FtpDirectoryResponse);
      R    : String    := Value (Temp);
   begin
      Free (Temp);
      return R;
   end sfFtpDirectoryResponse_GetMessage;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the directory returned in the response
   -- ///
   -- /// \param FtpDirectoryResponse : Ftp directory response
   -- ///
   -- /// \return Directory name
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfFtpDirectoryResponse_GetDirectory (FtpDirectoryResponse : sfFtpDirectoryResponse_Ptr) return String is
      function Internal (FtpDirectoryResponse : sfFtpDirectoryResponse_Ptr) return chars_ptr;
      pragma Import (C, Internal, "sfFtpDirectoryResponse_GetDirectory");
      Temp : chars_ptr := Internal (FtpDirectoryResponse);
      R    : String    := Value (Temp);
   begin
      Free (Temp);
      return R;
   end sfFtpDirectoryResponse_GetDirectory;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the full message contained in the response
   -- ///
   -- /// \param FtpResponse : Ftp response
   -- ///
   -- /// \return The response message
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfFtpResponse_GetMessage (FtpResponse : sfFtpResponse_Ptr) return String is
      function Internal (FtpResponse : sfFtpResponse_Ptr) return chars_ptr;
      pragma Import (C, Internal, "sfFtpResponse_GetMessage");
      Temp : chars_ptr := Internal (FtpResponse);
      R    : String    := Value (Temp);
   begin
      Free (Temp);
      return R;
   end sfFtpResponse_GetMessage;

   -- ////////////////////////////////////////////////////////////
   -- /// Log in using a username and a password
   -- ///
   -- /// \param Ftp :      Ftp instance
   -- /// \param UserName : User name
   -- /// \param Password : Password
   -- ///
   -- /// \return Server response to the request
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfFtp_Login
     (Ftp      : sfFtp_Ptr;
      UserName : String;
      Password : String)
      return     sfFtpResponse_Ptr
   is
      function Internal
        (Ftp      : sfFtp_Ptr;
         UserName : chars_ptr;
         Password : chars_ptr)
         return     sfFtpResponse_Ptr;
      pragma Import (C, Internal, "sfFtp_Login");
      Temp1 : chars_ptr         := New_String (UserName);
      Temp2 : chars_ptr         := New_String (Password);
      R     : sfFtpResponse_Ptr := Internal (Ftp, Temp1, Temp2);
   begin
      Free (Temp1);
      Free (Temp2);
      return R;
   end sfFtp_Login;

   -- ////////////////////////////////////////////////////////////
   -- /// Get the contents of the given directory
   -- /// (subdirectories and files)
   -- ///
   -- /// \param Ftp :       Ftp instance
   -- /// \param Directory : Directory to list ("" by default, the current one)
   -- ///
   -- /// \return Server response to the request
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfFtp_GetDirectoryListing (Ftp : sfFtp_Ptr; Directory : String) return sfFtpListingResponse_Ptr is
      function Internal (Ftp : sfFtp_Ptr; Directory : chars_ptr) return sfFtpListingResponse_Ptr;
      pragma Import (C, Internal, "sfFtp_GetDirectoryListing");
      Temp : chars_ptr                := New_String (Directory);
      R    : sfFtpListingResponse_Ptr := Internal (Ftp, Temp);
   begin
      Free (Temp);
      return R;
   end sfFtp_GetDirectoryListing;

   -- ////////////////////////////////////////////////////////////
   -- /// Change the current working directory
   -- ///
   -- /// \param Ftp :       Ftp instance
   -- /// \param Directory : New directory, relative to the current one
   -- ///
   -- /// \return Server response to the request
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfFtp_ChangeDirectory (Ftp : sfFtp_Ptr; Directory : String) return sfFtpResponse_Ptr is
      function Internal (Ftp : sfFtp_Ptr; Directory : chars_ptr) return sfFtpResponse_Ptr;
      pragma Import (C, Internal, "sfFtp_ChangeDirectory");
      Temp : chars_ptr         := New_String (Directory);
      R    : sfFtpResponse_Ptr := Internal (Ftp, Temp);
   begin
      Free (Temp);
      return R;
   end sfFtp_ChangeDirectory;

   -- ////////////////////////////////////////////////////////////
   -- /// Create a new directory
   -- ///
   -- /// \param Ftp :  Ftp instance
   -- /// \param Name : Name of the directory to create
   -- ///
   -- /// \return Server response to the request
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfFtp_MakeDirectory (Ftp : sfFtp_Ptr; Name : String) return sfFtpResponse_Ptr is
      function Internal (Ftp : sfFtp_Ptr; Name : chars_ptr) return sfFtpResponse_Ptr;
      pragma Import (C, Internal, "sfFtp_MakeDirectory");
      Temp : chars_ptr         := New_String (Name);
      R    : sfFtpResponse_Ptr := Internal (Ftp, Temp);
   begin
      Free (Temp);
      return R;
   end sfFtp_MakeDirectory;

   -- ////////////////////////////////////////////////////////////
   -- /// Remove an existing directory
   -- ///
   -- /// \param Ftp :  Ftp instance
   -- /// \param Name : Name of the directory to remove
   -- ///
   -- /// \return Server response to the request
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfFtp_DeleteDirectory (Ftp : sfFtp_Ptr; Name : String) return sfFtpResponse_Ptr is
      function Internal (Ftp : sfFtp_Ptr; Name : chars_ptr) return sfFtpResponse_Ptr;
      pragma Import (C, Internal, "sfFtp_DeleteDirectory");
      Temp : chars_ptr         := New_String (Name);
      R    : sfFtpResponse_Ptr := Internal (Ftp, Temp);
   begin
      Free (Temp);
      return R;
   end sfFtp_DeleteDirectory;

   -- ////////////////////////////////////////////////////////////
   -- /// Rename a file
   -- ///
   -- /// \param Ftp :     Ftp instance
   -- /// \param File :    File to rename
   -- /// \param NewName : New name
   -- ///
   -- /// \return Server response to the request
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfFtp_RenameFile
     (Ftp     : sfFtp_Ptr;
      File    : String;
      NewName : String)
      return    sfFtpResponse_Ptr
   is
      function Internal
        (Ftp     : sfFtp_Ptr;
         File    : chars_ptr;
         NewName : chars_ptr)
         return    sfFtpResponse_Ptr;
      pragma Import (C, Internal, "sfFtp_RenameFile");
      Temp1 : chars_ptr         := New_String (File);
      Temp2 : chars_ptr         := New_String (NewName);
      R     : sfFtpResponse_Ptr := Internal (Ftp, Temp1, Temp2);
   begin
      Free (Temp1);
      Free (Temp2);
      return R;
   end sfFtp_RenameFile;

   -- ////////////////////////////////////////////////////////////
   -- /// Remove an existing file
   -- ///
   -- /// \param Ftp :  Ftp instance
   -- /// \param Name : File to remove
   -- ///
   -- /// \return Server response to the request
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfFtp_DeleteFile (Ftp : sfFtp_Ptr; Name : String) return sfFtpResponse_Ptr is
      function Internal (Ftp : sfFtp_Ptr; Name : chars_ptr) return sfFtpResponse_Ptr;
      pragma Import (C, Internal, "sfFtp_DeleteFile");
      Temp : chars_ptr         := New_String (Name);
      R    : sfFtpResponse_Ptr := Internal (Ftp, Temp);
   begin
      Free (Temp);
      return R;
   end sfFtp_DeleteFile;

   -- ////////////////////////////////////////////////////////////
   -- /// Download a file from the server
   -- ///
   -- /// \param Ftp :         Ftp instance
   -- /// \param DistantFile : Path of the distant file to download
   -- /// \param DestPath :    Where to put to file on the local computer
   -- /// \param Mode :        Transfer mode (binary by default)
   -- ///
   -- /// \return Server response to the request
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfFtp_Download
     (Ftp         : sfFtp_Ptr;
      DistantFile : String;
      DestPath    : String;
      Mode        : sfFtpTransferMode)
      return        sfFtpResponse_Ptr
   is
      function Internal
        (Ftp         : sfFtp_Ptr;
         DistantFile : chars_ptr;
         DestPath    : chars_ptr;
         Mode        : sfFtpTransferMode)
         return        sfFtpResponse_Ptr;
      pragma Import (C, Internal, "sfFtp_Download");
      Temp1 : chars_ptr         := New_String (DistantFile);
      Temp2 : chars_ptr         := New_String (DestPath);
      R     : sfFtpResponse_Ptr := Internal (Ftp, Temp1, Temp2, Mode);
   begin
      Free (Temp1);
      Free (Temp2);
      return R;
   end sfFtp_Download;

   -- ////////////////////////////////////////////////////////////
   -- /// Upload a file to the server
   -- ///
   -- /// \param Ftp :       Ftp instance
   -- /// \param LocalFile : Path of the local file to upload
   -- /// \param DestPath :  Where to put to file on the server
   -- /// \param Mode :      Transfer mode (binary by default)
   -- ///
   -- /// \return Server response to the request
   -- ///
   -- ////////////////////////////////////////////////////////////
   function sfFtp_Upload
     (Ftp       : sfFtp_Ptr;
      LocalFile : String;
      DestPath  : String;
      Mode      : sfFtpTransferMode)
      return      sfFtpResponse_Ptr
   is
      function Internal
        (Ftp       : sfFtp_Ptr;
         LocalFile : chars_ptr;
         DestPath  : chars_ptr;
         Mode      : sfFtpTransferMode)
         return      sfFtpResponse_Ptr;
      pragma Import (C, Internal, "sfFtp_Upload");
      Temp1 : chars_ptr         := New_String (LocalFile);
      Temp2 : chars_ptr         := New_String (DestPath);
      R     : sfFtpResponse_Ptr := Internal (Ftp, Temp1, Temp2, Mode);
   begin
      Free (Temp1);
      Free (Temp2);
      return R;
   end sfFtp_Upload;

end Sf.Network.Ftp;
