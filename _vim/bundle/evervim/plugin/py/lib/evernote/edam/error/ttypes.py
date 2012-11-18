#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

from thrift.Thrift import *

from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol
try:
  from thrift.protocol import fastbinary
except:
  fastbinary = None


class EDAMErrorCode(object):
  """
  Numeric codes indicating the type of error that occurred on the
  service.
  <dl>
    <dt>UNKNOWN</dt
      <dd>No information available about the error</dd>
    <dt>BAD_DATA_FORMAT</dt>
      <dd>The format of the request data was incorrect</dd>
    <dt>PERMISSION_DENIED</dt>
      <dd>Not permitted to perform action</dd>
    <dt>INTERNAL_ERROR</dt>
      <dd>Unexpected problem with the service</dd>
    <dt>DATA_REQUIRED</dt>
      <dd>A required parameter/field was absent</dd>
    <dt>LIMIT_REACHED</dt>
      <dd>Operation denied due to data model limit</dd>
    <dt>QUOTA_REACHED</dt>
      <dd>Operation denied due to user storage limit</dd>
    <dt>INVALID_AUTH</dt>
      <dd>Username and/or password incorrect</dd>
    <dt>AUTH_EXPIRED</dt>
      <dd>Authentication token expired</dd>
    <dt>DATA_CONFLICT</dt>
      <dd>Change denied due to data model conflict</dd>
    <dt>ENML_VALIDATION</dt>
      <dd>Content of submitted note was malformed</dd>
    <dt>SHARD_UNAVAILABLE</dt>
      <dd>Service shard with account data is temporarily down</dd>
  </dl>
  """
  UNKNOWN = 1
  BAD_DATA_FORMAT = 2
  PERMISSION_DENIED = 3
  INTERNAL_ERROR = 4
  DATA_REQUIRED = 5
  LIMIT_REACHED = 6
  QUOTA_REACHED = 7
  INVALID_AUTH = 8
  AUTH_EXPIRED = 9
  DATA_CONFLICT = 10
  ENML_VALIDATION = 11
  SHARD_UNAVAILABLE = 12

  _VALUES_TO_NAMES = {
    1: "UNKNOWN",
    2: "BAD_DATA_FORMAT",
    3: "PERMISSION_DENIED",
    4: "INTERNAL_ERROR",
    5: "DATA_REQUIRED",
    6: "LIMIT_REACHED",
    7: "QUOTA_REACHED",
    8: "INVALID_AUTH",
    9: "AUTH_EXPIRED",
    10: "DATA_CONFLICT",
    11: "ENML_VALIDATION",
    12: "SHARD_UNAVAILABLE",
  }

  _NAMES_TO_VALUES = {
    "UNKNOWN": 1,
    "BAD_DATA_FORMAT": 2,
    "PERMISSION_DENIED": 3,
    "INTERNAL_ERROR": 4,
    "DATA_REQUIRED": 5,
    "LIMIT_REACHED": 6,
    "QUOTA_REACHED": 7,
    "INVALID_AUTH": 8,
    "AUTH_EXPIRED": 9,
    "DATA_CONFLICT": 10,
    "ENML_VALIDATION": 11,
    "SHARD_UNAVAILABLE": 12,
  }

class EDAMUserException(Exception):
  """
  This exception is thrown by EDAM procedures when a call fails as a result of
  a problem that a user may be able to resolve.  For example, if the user
  attempts to add a note to their account which would exceed their storage
  quota, this type of exception may be thrown to indicate the source of the
  error so that they can choose an alternate action.
  
  This exception would not be used for internal system errors that do not
  reflect user actions, but rather reflect a problem within the service that
  the user cannot resolve.
  
  errorCode:  The numeric code indicating the type of error that occurred.
    must be one of the values of EDAMErrorCode.
  
  parameter:  If the error applied to a particular input parameter, this will
    indicate which parameter.
  
  Attributes:
   - errorCode
   - parameter
  """

  thrift_spec = (
    None, # 0
    (1, TType.I32, 'errorCode', None, None, ), # 1
    (2, TType.STRING, 'parameter', None, None, ), # 2
  )

  def __init__(self, errorCode=None, parameter=None,):
    self.errorCode = errorCode
    self.parameter = parameter

  def read(self, iprot):
    if iprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and isinstance(iprot.trans, TTransport.CReadableTransport) and self.thrift_spec is not None and fastbinary is not None:
      fastbinary.decode_binary(self, iprot.trans, (self.__class__, self.thrift_spec))
      return
    iprot.readStructBegin()
    while True:
      (fname, ftype, fid) = iprot.readFieldBegin()
      if ftype == TType.STOP:
        break
      if fid == 1:
        if ftype == TType.I32:
          self.errorCode = iprot.readI32();
        else:
          iprot.skip(ftype)
      elif fid == 2:
        if ftype == TType.STRING:
          self.parameter = iprot.readString();
        else:
          iprot.skip(ftype)
      else:
        iprot.skip(ftype)
      iprot.readFieldEnd()
    iprot.readStructEnd()

  def write(self, oprot):
    if oprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and self.thrift_spec is not None and fastbinary is not None:
      oprot.trans.write(fastbinary.encode_binary(self, (self.__class__, self.thrift_spec)))
      return
    oprot.writeStructBegin('EDAMUserException')
    if self.errorCode != None:
      oprot.writeFieldBegin('errorCode', TType.I32, 1)
      oprot.writeI32(self.errorCode)
      oprot.writeFieldEnd()
    if self.parameter != None:
      oprot.writeFieldBegin('parameter', TType.STRING, 2)
      oprot.writeString(self.parameter)
      oprot.writeFieldEnd()
    oprot.writeFieldStop()
    oprot.writeStructEnd()

  def __str__(self):
    return repr(self)

  def __repr__(self):
    L = ['%s=%r' % (key, value)
      for key, value in self.__dict__.iteritems()]
    return '%s(%s)' % (self.__class__.__name__, ', '.join(L))

  def __eq__(self, other):
    return isinstance(other, self.__class__) and self.__dict__ == other.__dict__

  def __ne__(self, other):
    return not (self == other)

class EDAMSystemException(Exception):
  """
  This exception is thrown by EDAM procedures when a call fails as a result of
  an a problem in the service that could not be changed through user action.
  
  errorCode:  The numeric code indicating the type of error that occurred.
    must be one of the values of EDAMErrorCode.
  
  message:  This may contain additional information about the error
  
  Attributes:
   - errorCode
   - message
  """

  thrift_spec = (
    None, # 0
    (1, TType.I32, 'errorCode', None, None, ), # 1
    (2, TType.STRING, 'message', None, None, ), # 2
  )

  def __init__(self, errorCode=None, message=None,):
    self.errorCode = errorCode
    self.message = message

  def read(self, iprot):
    if iprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and isinstance(iprot.trans, TTransport.CReadableTransport) and self.thrift_spec is not None and fastbinary is not None:
      fastbinary.decode_binary(self, iprot.trans, (self.__class__, self.thrift_spec))
      return
    iprot.readStructBegin()
    while True:
      (fname, ftype, fid) = iprot.readFieldBegin()
      if ftype == TType.STOP:
        break
      if fid == 1:
        if ftype == TType.I32:
          self.errorCode = iprot.readI32();
        else:
          iprot.skip(ftype)
      elif fid == 2:
        if ftype == TType.STRING:
          self.message = iprot.readString();
        else:
          iprot.skip(ftype)
      else:
        iprot.skip(ftype)
      iprot.readFieldEnd()
    iprot.readStructEnd()

  def write(self, oprot):
    if oprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and self.thrift_spec is not None and fastbinary is not None:
      oprot.trans.write(fastbinary.encode_binary(self, (self.__class__, self.thrift_spec)))
      return
    oprot.writeStructBegin('EDAMSystemException')
    if self.errorCode != None:
      oprot.writeFieldBegin('errorCode', TType.I32, 1)
      oprot.writeI32(self.errorCode)
      oprot.writeFieldEnd()
    if self.message != None:
      oprot.writeFieldBegin('message', TType.STRING, 2)
      oprot.writeString(self.message)
      oprot.writeFieldEnd()
    oprot.writeFieldStop()
    oprot.writeStructEnd()

  def __str__(self):
    return repr(self)

  def __repr__(self):
    L = ['%s=%r' % (key, value)
      for key, value in self.__dict__.iteritems()]
    return '%s(%s)' % (self.__class__.__name__, ', '.join(L))

  def __eq__(self, other):
    return isinstance(other, self.__class__) and self.__dict__ == other.__dict__

  def __ne__(self, other):
    return not (self == other)

class EDAMNotFoundException(Exception):
  """
  This exception is thrown by EDAM procedures when a caller asks to perform
  an operation that does not exist.  This may be thrown based on an invalid
  primary identifier (e.g. a bad GUID), or when the caller refers to an object
  by another unique identifier (e.g. a User's email address).
  
  identifier:  the object identifier that was not found on the server.
  
  key:  the value passed from the client in the identifier, which was not
    found.  E.g. the GUID of an object that was not found.
  
  Attributes:
   - identifier
   - key
  """

  thrift_spec = (
    None, # 0
    (1, TType.STRING, 'identifier', None, None, ), # 1
    (2, TType.STRING, 'key', None, None, ), # 2
  )

  def __init__(self, identifier=None, key=None,):
    self.identifier = identifier
    self.key = key

  def read(self, iprot):
    if iprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and isinstance(iprot.trans, TTransport.CReadableTransport) and self.thrift_spec is not None and fastbinary is not None:
      fastbinary.decode_binary(self, iprot.trans, (self.__class__, self.thrift_spec))
      return
    iprot.readStructBegin()
    while True:
      (fname, ftype, fid) = iprot.readFieldBegin()
      if ftype == TType.STOP:
        break
      if fid == 1:
        if ftype == TType.STRING:
          self.identifier = iprot.readString();
        else:
          iprot.skip(ftype)
      elif fid == 2:
        if ftype == TType.STRING:
          self.key = iprot.readString();
        else:
          iprot.skip(ftype)
      else:
        iprot.skip(ftype)
      iprot.readFieldEnd()
    iprot.readStructEnd()

  def write(self, oprot):
    if oprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and self.thrift_spec is not None and fastbinary is not None:
      oprot.trans.write(fastbinary.encode_binary(self, (self.__class__, self.thrift_spec)))
      return
    oprot.writeStructBegin('EDAMNotFoundException')
    if self.identifier != None:
      oprot.writeFieldBegin('identifier', TType.STRING, 1)
      oprot.writeString(self.identifier)
      oprot.writeFieldEnd()
    if self.key != None:
      oprot.writeFieldBegin('key', TType.STRING, 2)
      oprot.writeString(self.key)
      oprot.writeFieldEnd()
    oprot.writeFieldStop()
    oprot.writeStructEnd()

  def __str__(self):
    return repr(self)

  def __repr__(self):
    L = ['%s=%r' % (key, value)
      for key, value in self.__dict__.iteritems()]
    return '%s(%s)' % (self.__class__.__name__, ', '.join(L))

  def __eq__(self, other):
    return isinstance(other, self.__class__) and self.__dict__ == other.__dict__

  def __ne__(self, other):
    return not (self == other)

